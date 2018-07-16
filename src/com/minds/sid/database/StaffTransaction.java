package com.minds.sid.database;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import javax.mail.MessagingException;

import org.apache.commons.lang3.tuple.ImmutablePair;

import com.minds.sid.model.StaffCourseAssociation;
import com.minds.sid.model.StaffMember;
import com.minds.sid.model.StaffRole;


public class StaffTransaction {
	Statement stmt;
	ResultSet rs;
	DbConnection conn = new DbConnection();
	
	public List<StaffCourseAssociation> getStaffCourseAllocationList() {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		LinkedList<StaffCourseAssociation> staffCourseAssociations = new LinkedList<StaffCourseAssociation>();
		try {
			query = " select "
					+ " sca.staff_course_id as runningId,"
					+ "org.organisation_unit_name as orgUnit,"
					+ "sca.staff_id as staffId,"
					+ "staff.first_name as staffName,"
					+ "staff.staff_code as staffCode,"
					+ "sca.course_id as courseId,"
					+ "course.name as courseName,"
					+ "course.courseCode as courseCode,"
					+ "sca.parent_staff_id as reportsToStaffId,"
					+ "staff2.first_name as reportingToStaff,"
					+ "staff2.staff_code as reportingStaffCode,"
					+ "sca.role_id as roleId,"
					+ "role.role_name as staffRole,"
					+ "role.role_code as roleCode,"
					+ "sca.date_from as fromDate,"
					+ "sca.date_to as toDate "
					+ "from staff_course_association sca "
					+ "left join organisation_units org ON org.organisation_unit_id = sca.org_unit_id "
					+ "left join master_staff staff ON staff.id = sca.staff_id "
					+ "left join  master_course course ON course.id = sca.course_id "
					+ "left join  master_staff staff2 ON staff2.id = sca.parent_staff_id "
					+ "left join staff_roles role ON role.role_id  = sca.role_id " 
					+"where sca.softDelete = 'no'";
					System.out.println("query    -----        "+query);
			rs = stmt.executeQuery(query); 
			staffCourseAssociations = setStaffCourseAllocationList(rs,staffCourseAssociations);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return staffCourseAssociations;
	}
	
	/*Join Query to get data from different tables using ids
	 * 
	  select
	  sca.staff_course_id as runningId,
org.organisation_unit_name as orgUnit,
sca.staff_id as staffId,
staff.first_name as staffName,
staff.staff_code as staffCode,
sca.course_id as courseId,
course.name as courseName,
course.courseCode as courseCode,
sca.parent_staff_id as reportsToStaffId,
staff2.first_name as reportingToStaff,
staff2.staff_code as reportingStaffCode,
sca.role_id as roleId,
role.role_name as staffRole,
role.role_code as roleCode, 
sca.date_from as fromDate,
sca.date_to as toDate  
from staff_course_association sca
left join organisation_units org ON org.organisation_unit_id = sca.org_unit_id 
left join master_staff staff ON staff.id = sca.staff_id 
left join  master_course course ON course.id = sca.course_id 
left join  master_staff staff2 ON staff2.id = sca.parent_staff_id 
left join staff_roles role ON role.role_id  = sca.role_id 
where sca.softDelete = 'no';

	*/
	private LinkedList<StaffCourseAssociation> setStaffCourseAllocationList(
			ResultSet rs2,
			LinkedList<StaffCourseAssociation> staffCourseAssociations) {
		StaffCourseAssociation staffCourseAssociation = null;
		// All Field Names from the View Table Generated
		// runningId, orgUnit, staffId, staffName, staffCode, courseId, courseName, courseCode, 
		// reportsToStaffId, reportingToStaff, reportingStaffCode, roleId, staffRole, roleCode, fromDate, toDate
		try
		{
			while(rs2.next()){
				staffCourseAssociation = new StaffCourseAssociation();
				staffCourseAssociation.setId(rs2.getInt("runningId"));
				staffCourseAssociation.setOrgUnit(rs2.getString("orgUnit"));
				staffCourseAssociation.setStaffId(rs2.getInt("staffId"));
				staffCourseAssociation.setReportsToStaffId(rs2.getInt("reportsToStaffId"));
				staffCourseAssociation.setRoleId(rs2.getInt("roleId"));
				staffCourseAssociation.setCourseId(rs2.getInt("courseId"));
				staffCourseAssociation.setDateFrom(rs2.getDate("fromDate"));
				staffCourseAssociation.setDateTo(rs2.getDate("toDate"));
			//	staffCourseAssociation.setOtherDetails(rs2.getString("otherDetails"));
				
				staffCourseAssociation.setStaffName(rs2.getString("staffName"));
				staffCourseAssociation.setStaffCode(rs2.getString("staffCode"));
				staffCourseAssociation.setCourseName(rs2.getString("courseName"));
				staffCourseAssociation.setCourseCode(rs2.getString("courseCode"));
				staffCourseAssociation.setReportingToStaff(rs2.getString("reportingToStaff"));
				staffCourseAssociation.setReportingStaffCode(rs2.getString("reportingStaffCode"));
				staffCourseAssociation.setStaffRole(rs2.getString("staffRole"));
				staffCourseAssociation.setRoleCode(rs2.getString("roleCode"));
				
			/*	staffCourseAssociation.setSoftDelete(rs2.getString("softDelete"));
				staffCourseAssociation.setCreatedAt(rs2.getDate("createdAt"));
				staffCourseAssociation.setCreatedBy(rs2.getString("createdBy"));
				staffCourseAssociation.setDeletedAt(rs2.getDate("deletedAt"));
				staffCourseAssociation.setDeletedBy(rs2.getString("deletedBy"));
				staffCourseAssociation.setModifiedAt(rs2.getDate("modifiedAt"));
				staffCourseAssociation.setModifiedBy(rs2.getString("modifiedBy"));*/
				staffCourseAssociations.add(staffCourseAssociation);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return staffCourseAssociations;
	}



	public String associateCourseStaff(StaffCourseAssociation staffCourseObj){
		//StaffCourseAssociation staffCourseAssociation = new StaffCourseAssociation();
		String isCourseAssociatedToStaff = verifyStaffCourseAssociation(staffCourseObj);
		if(isCourseAssociatedToStaff.equalsIgnoreCase("valid")){
			String isCourseToStaffAllocated = allocateCourseToStaff(staffCourseObj);
			return isCourseToStaffAllocated;
		}else
			return isCourseAssociatedToStaff;
	}
	

	private String allocateCourseToStaff(StaffCourseAssociation staffCourseObj) {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		
		try {
			query = "insert into staff_course_association values"
					+ "(null,"+staffCourseObj.getOrgUnitId()+","
							+ ""+staffCourseObj.getStaffId()+","
							+ ""+staffCourseObj.getCourseId()+","
							+ ""+staffCourseObj.getReportsToStaffId()+","
							+ ""+staffCourseObj.getRoleId()+","
							+ ""+staffCourseObj.getDateFrom()+","
							+ ""+staffCourseObj.getDateTo()+","
							+ "'"+staffCourseObj.getOtherDetails()+"',"
									+ "'no',"
									+ "'"+staffCourseObj.getCreatedBy()+"',"
									+ "now(),"
									+ "null,"
									+ "null,"
									+ "null,"
									+ "null)";	
											
			System.out.println("Register new staff_course_association  --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "Course is Allocated to Staff successfully";
		}
		else{
			return "Allocation of Course to Staff Failed. Please associate course again or contact administrator";
		}
		
	}

	private String verifyStaffCourseAssociation(
			StaffCourseAssociation staffCourseObj) {
		stmt = conn.dbConnect();
		String query = "select * from staff_course_association where org_unit_id = "+staffCourseObj.getOrgUnitId()+""
				+ " and staff_id = "+staffCourseObj.getStaffId()+" and course_id = "+staffCourseObj.getCourseId()+"";
		System.out.println("verifyStaffCourseAssociation --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				if(rs.next())
				{
					return "The Course you are trying to associate with the staff is already Associated. Recheck your decisions ";
				}
			}
			else{
				return "valid";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return "invalid";
		}
		return "valid";
		
	}

	public LinkedList<StaffRole> getStaffRoleList() {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		LinkedList<StaffRole> staffRoles = new LinkedList<StaffRole>();
		try {
			query = "Select * from staff_roles  where softDelete = 'no'";
			rs = stmt.executeQuery(query);
			staffRoles = setRolesList(rs,staffRoles);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return staffRoles;
	}
	
	private LinkedList<StaffRole> setRolesList(ResultSet rs2, LinkedList<StaffRole> staffRoles) {
		StaffRole staffRole = null;
		try
		{
			while(rs2.next()){
				staffRole = new StaffRole();
				staffRole.setId(rs2.getInt("role_id"));
				staffRole.setRoleCode(rs2.getString("role_code"));
				staffRole.setRoleName(rs2.getString("role_name"));
				staffRole.setRoleDescription(rs2.getString("role_description"));
				staffRole.setCreatedAt(rs2.getDate("createdAt"));
				staffRole.setCreatedBy(rs2.getString("createdBy"));
				staffRole.setDeletedAt(rs2.getDate("deletedAt"));
				staffRole.setDeletedBy(rs2.getString("deletedBy"));
				staffRole.setSoftDelete(rs2.getString("softDelete"));
				staffRole.setModifiedAt(rs2.getDate("modifiedAt"));
				staffRole.setModifiedBy(rs2.getString("modifiedBy"));
				staffRoles.add(staffRole);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return staffRoles;
	}

	//staffRoleOnBoard
	public String staffRoleOnBoard(StaffRole staffRole) {
		String isRoleDefined = verifyNewRole(staffRole);
		if(isRoleDefined.equalsIgnoreCase("valid")){
			String isStaffRoleOnBoard = createStaffRole(staffRole);
			return isStaffRoleOnBoard;
		}else
			return isRoleDefined;
		
	}
	
	private String createStaffRole(StaffRole staffRole) {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		
		try {
			query = "insert into staff_roles values"
					+ "(null,'"+staffRole.getRoleCode()+"','"+staffRole.getRoleName()+"','"
							+ ""+staffRole.getRoleDescription()+"',"
							+ "'no','"+staffRole.getCreatedBy()+"',now(),null,null,null,null)";
			System.out.println("registerNewStaff Role --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "staff role created successful";
		}
		else{
			return "staff role creation Failed. Please create role again or contact administrator";
		}
		//return null;
	}

	private String verifyNewRole(StaffRole staffRole) {
		stmt = conn.dbConnect();
		String query = "select * from staff_roles where role_code = '"+staffRole.getRoleCode()+"' and softDelete = 'no'";
		System.out.println("verifyStaffRole --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				if(rs.next())
				{
					return "StaffRole with the  Role Code : "+staffRole.getRoleCode()+" already exists. Do verify the staffRoles or contact administrator ";
				}
			}
			else{
				return "valid";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return "invalid";
		}
		return "valid";	
		
	}

	public LinkedList<StaffMember> getStaffList() {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		LinkedList<StaffMember> staffMembers = new LinkedList<StaffMember>();
		try {
			query = "Select * from master_staff   where softDelete = 'no'";
			rs = stmt.executeQuery(query);
			staffMembers = setStaffMembersList(rs,staffMembers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return staffMembers;
	}
	
	
	public StaffMember getStaffDetailsById(int id) {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		//BaseModel basemodel = new BaseModel();
		/*LinkedList<StaffMember> staffMembers = new LinkedList<StaffMember>();*/
		StaffMember staffMember = new StaffMember();
		try {
			query = "Select * from master_staff   where id ="+id;
		
			ResultSet rs3 = stmt.executeQuery(query);
			staffMember = setStaffObjectById(rs3,staffMember);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return staffMember;
	}
	
	
	
	
	
	private LinkedList<StaffMember> setStaffMembersList(ResultSet rs2, LinkedList<StaffMember> staffMembers) {
		StaffMember staffMember = null;
		
		try
		{
			//id, staff_code, first_name, middle_name, last_name, date_of_birth, gender, email, password,
			//phoneNo, address, message, other_details, softDelete, createdBy, createdAt, deletedBy, deletedAt, modifiedBy, modifiedAt
			while(rs2.next()){
				staffMember = new StaffMember();
				staffMember.setId(rs2.getInt("id"));
				staffMember.setStaffCode(rs2.getString("staff_code"));
				staffMember.setFirstname(rs2.getString("first_name"));
				staffMember.setMiddlename(rs2.getString("middle_name"));
				staffMember.setLastname(rs2.getString("last_name"));
				staffMember.setGender(rs2.getString("gender"));
				staffMember.setDob(rs2.getDate("date_of_birth"));
				staffMember.setPhoneNo(rs2.getString("phoneNo"));
				staffMember.setEmail(rs2.getString("email"));
				staffMember.setPassword(rs2.getString("password"));
				staffMember.setAddress(rs2.getString("address"));
				staffMember.setMessage(rs2.getString("message"));
				staffMember.setOtherDetails(rs2.getString("other_details"));
				staffMember.setSoftDelete(rs2.getString("softDelete"));
				staffMember.setCreatedAt(rs2.getDate("createdAt"));
				staffMember.setCreatedBy(rs2.getString("createdBy"));
				staffMember.setDeletedAt(rs2.getDate("deletedAt"));
				staffMember.setDeletedBy(rs2.getString("deletedBy"));
				staffMember.setModifiedAt(rs2.getDate("modifiedAt"));
				staffMember.setModifiedBy(rs2.getString("modifiedBy"));
				staffMembers.add(staffMember);
				System.out.println("staff added to list");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return staffMembers;
	}

	
	public boolean createStaff(StaffMember staffMember){
		stmt = conn.dbConnect();
		//String verifyEmail = checkConsumerEmail(consumer);
		String query = "";
		boolean queryResult =true;
		//int code = (int)(Math.random()*10000);
		//String customCode = "cons"+code+"sid";
		//System.out.println("verifyEmail "+verifyEmail);
		//SendMail mailObj;
		//String mailStatus = "";
		/*
		 *  id, staff_code, first_name, middle_name, last_name, date_of_birth, gender, email, password, phoneNo, address,
		 *   message, other_details, softDelete, createdBy, createdAt, deletedBy, deletedAt, modifiedBy, modifiedAt
		*/		
		try {
			query = "insert into master_staff values"
					+ "(null,"
					+ "'"+staffMember.getStaffCode()+"',"
					+ "'"+staffMember.getFirstname()+"','"+staffMember.getMiddlename()+"','"+staffMember.getLastname()+"',"
							+ "'"+staffMember.getDob()+"',"
							+ "'"+staffMember.getGender()+"',"
							+ "'"+staffMember.getEmail()+"',"
							+ "'"+staffMember.getPassword()+"',"
							+ "'"+staffMember.getPhoneNo()+"',"
							+ "'"+staffMember.getAddress()+"',"
							+ "'"+staffMember.getMessage()+"',"
							+ "'"+staffMember.getOtherDetails()+"',"
							+ "'no','"+staffMember.getCreatedBy()+"',now(),null,null,null,null)";
			System.out.println("registerNewStaff --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		return queryResult;
		
		
	}
	
	public String verifyNewStaff(StaffMember staffMember) 
	{
		stmt = conn.dbConnect();
		String query = "select * from master_staff where staff_Code = '"+staffMember.getStaffCode()+"'";
		System.out.println("verifyStaff --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				if(rs.next())
				{
					return "Staff with the  code : "+staffMember.getStaffCode()+" already exists. Do verify the staff details or contact administrator ";
				}
			}
			else{
				return "valid";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return "invalid";
		}
		return "valid";		
	}
	
	//staffOnBoard
	public String staffOnBoard(StaffMember staffMember) {
		String isStaffAvailable = verifyNewStaff(staffMember);
		if(isStaffAvailable.equalsIgnoreCase("valid")){
			boolean isStaffOnBoard = createStaff(staffMember);
			String emailSentStatus = "";
			String onboardStaffMsg = "staff onboard successful";
			if(isStaffOnBoard == true){
				try {
				   int code = (int)(Math.random()*10000);
		    		String customCode = "MU_"+code+"_sid"; 
		    		stmt = conn.dbConnect();
		    		String query2 = "Select * from master_staff where email ='"+staffMember.getEmail()+"' and softDelete = 'no'";
		    		rs = stmt.executeQuery(query2);
		    		staffMember = setStaffObjectByEmailId(rs,staffMember);
		    		String query = "INSERT INTO user_login_code "
		    				+ " VALUES"
		    				+ "(null,"
		    				+ ""+staffMember.getId()+","
		    				+ "'"+staffMember.getEmail()+"',"
		    				+ "'"+customCode+"',"
		    				+ "'no',"
		    				+ "'Admin',"
		    				+ "now(),"
		    				+ "null,"
		    				+ "null,"
		    				+ "null,"
		    				+ "null)";
		    		System.out.println("registerNewStaff --insert Query --- "+query);
					boolean queryResult = stmt.execute(query);
					System.out.println("user_login_code created and inserted in table ------ "+queryResult);
					emailSentStatus =	sendStaffOnboardEmail(customCode);
					if(emailSentStatus.equalsIgnoreCase("success")){
						onboardStaffMsg = onboardStaffMsg + ". Please check you email for Confirmation";
					}else{
						onboardStaffMsg = onboardStaffMsg + ". Initiate confirmation email here http://localhost:8080/universityLBO_Latest/onboard/resendLoginCode.jsp?email="+staffMember.getEmail();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return onboardStaffMsg;
			}
			else{
				return "staff onboarding Failed. Please create staff again or contact administrator";
			}
		}else
			return isStaffAvailable;
		
	}

	public String staffOnUpdate(StaffMember staffMember) {
		//String isStaffAvailable = verifyNewStaff(staffMember);
		
			String isstaffOnUpdate = updateStaff(staffMember);
			return isstaffOnUpdate;
}

	private String sendStaffOnboardEmail(String customCode) {
		try {
            HtmlEmailSender mailer = new HtmlEmailSender(HtmlEmailSender.GMAIL_CONFIG, ImmutablePair.of("ram.hebbal@gmail.com", "GNavaneet7*"));
         
            //HtmlEmailSender mailer = new HtmlEmailSender(HtmlEmailSender.GMAIL_CONFIG, ImmutablePair.of("test@gmail.com", "password"));
    		String urlToOnboard = "http://localhost:8080/universityLBO_Latest/onboard/loginWithCode.jsp?customCode="+customCode;
    		String onBoardMessage = " Please enter  this code "+customCode+" for first time when you are onboarding the application System";
    		String emailMessageTitle = "Instructions and Code to onboard Application System";
    		String emailHtmlContent = "<html>"
    				+ "<head>"
    				+ "<style>"
    				+ " .colored {color: blue; } #body { font-size: 14px;}"
    				+ "  </style>"
    				+ "</head>"
    				+ " <body>"
    				+ " <div id='body'>"
    				+ "<p>Hi System User,</p>"
    				+ "<p class='colored'>"+onBoardMessage+"</p>"
    				+ "<p class='colored'>Please follow the URL</p>"
    				+ "<a href='"+urlToOnboard+"' target='_blank'>Click here to Login</a>"
    				+ "<p>Thanks</p>"
    				+ "<p>System Admin</p>"
    				+ "</div>"
    				+ "</body>"
    				+ "</html>"
    				;
            /*
				<html>
  <head>
    <style>
      .colored {
        color: blue;
      }x
      #body {
        font-size: 14px;
      }
    </style>
  </head>
  <body>
    <div id='body'>
      <p>Hi System User,</p>
      <p class='colored'>This text is blue.</p>
      <p>Jerry</p>
    </div>
  </body>
</html>

            */
            
            mailer.sendHtmlEmail("siddaram.hebbal@outlook.com", emailMessageTitle, emailHtmlContent);
            return "success";
        } catch (MessagingException e) {
            e.printStackTrace();
            return e.getMessage();
        }
		
	}
	
	private StaffMember setStaffObjectByEmailId(ResultSet rs2, StaffMember staffMember){
		try
		{
			//id, staff_code, first_name, middle_name, last_name, date_of_birth, gender, email, password,
			//phoneNo, address, message, other_details, softDelete, createdBy, createdAt, deletedBy, deletedAt, modifiedBy, modifiedAt
			while(rs2.next()){
				staffMember.setId(rs2.getInt("id"));
				staffMember.setStaffCode(rs2.getString("staff_code"));
				staffMember.setFirstname(rs2.getString("first_name"));
				staffMember.setMiddlename(rs2.getString("middle_name"));
				staffMember.setLastname(rs2.getString("last_name"));
				staffMember.setGender(rs2.getString("gender"));
				staffMember.setDob(rs2.getDate("date_of_birth"));
				staffMember.setPhoneNo(rs2.getString("phoneNo"));
				staffMember.setEmail(rs2.getString("email"));
				staffMember.setPassword(rs2.getString("password"));
				staffMember.setAddress(rs2.getString("address"));
				staffMember.setMessage(rs2.getString("message"));
				staffMember.setOtherDetails(rs2.getString("other_details"));
				staffMember.setSoftDelete(rs2.getString("softDelete"));
				staffMember.setCreatedAt(rs2.getDate("createdAt"));
				staffMember.setCreatedBy(rs2.getString("createdBy"));
				staffMember.setDeletedAt(rs2.getDate("deletedAt"));
				staffMember.setDeletedBy(rs2.getString("deletedBy"));
				staffMember.setModifiedAt(rs2.getDate("modifiedAt"));
				staffMember.setModifiedBy(rs2.getString("modifiedBy"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return staffMember;
	}
private StaffMember setStaffObjectById(ResultSet rs3, StaffMember staffMember){
		try
		{
			//id, staff_code, first_name, middle_name, last_name, date_of_birth, gender, email, password,
			//phoneNo, address, message, other_details, softDelete, createdBy, createdAt, deletedBy, deletedAt, modifiedBy, modifiedAt
			while(rs3.next()){
				staffMember.setId(rs3.getInt("id"));
				staffMember.setStaffCode(rs3.getString("staff_code"));
				staffMember.setFirstname(rs3.getString("first_name"));
				staffMember.setMiddlename(rs3.getString("middle_name"));
				staffMember.setLastname(rs3.getString("last_name"));
				staffMember.setGender(rs3.getString("gender"));
				staffMember.setDob(rs3.getDate("date_of_birth"));
				staffMember.setPhoneNo(rs3.getString("phoneNo"));
				staffMember.setEmail(rs3.getString("email"));
				staffMember.setPassword(rs3.getString("password"));
				staffMember.setAddress(rs3.getString("address"));
				staffMember.setMessage(rs3.getString("message"));
				staffMember.setOtherDetails(rs3.getString("other_details"));
				staffMember.setSoftDelete(rs3.getString("softDelete"));
				staffMember.setCreatedAt(rs3.getDate("createdAt"));
				staffMember.setCreatedBy(rs3.getString("createdBy"));
				staffMember.setDeletedAt(rs3.getDate("deletedAt"));
				staffMember.setDeletedBy(rs3.getString("deletedBy"));
				staffMember.setModifiedAt(rs3.getDate("modifiedAt"));
				staffMember.setModifiedBy(rs3.getString("modifiedBy"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return staffMember;
	}
	
	
	private StaffMember setRoleById(ResultSet rs3, StaffMember staffMember){
		try
		{
			//id, staff_code, first_name, middle_name, last_name, date_of_birth, gender, email, password,
			//phoneNo, address, message, other_details, softDelete, createdBy, createdAt, deletedBy, deletedAt, modifiedBy, modifiedAt
			while(rs3.next()){
				staffMember.setId(rs3.getInt("id"));
				staffMember.setStaffCode(rs3.getString("staff_code"));
				staffMember.setFirstname(rs3.getString("first_name"));
				staffMember.setMiddlename(rs3.getString("middle_name"));
				staffMember.setLastname(rs3.getString("last_name"));
				staffMember.setGender(rs3.getString("gender"));
				staffMember.setDob(rs3.getDate("date_of_birth"));
				staffMember.setPhoneNo(rs3.getString("phoneNo"));
				staffMember.setEmail(rs3.getString("email"));
				staffMember.setPassword(rs3.getString("password"));
				staffMember.setAddress(rs3.getString("address"));
				staffMember.setMessage(rs3.getString("message"));
				staffMember.setOtherDetails(rs3.getString("other_details"));
				staffMember.setSoftDelete(rs3.getString("softDelete"));
				staffMember.setCreatedAt(rs3.getDate("createdAt"));
				staffMember.setCreatedBy(rs3.getString("createdBy"));
				staffMember.setDeletedAt(rs3.getDate("deletedAt"));
				staffMember.setDeletedBy(rs3.getString("deletedBy"));
				staffMember.setModifiedAt(rs3.getDate("modifiedAt"));
				staffMember.setModifiedBy(rs3.getString("modifiedBy"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return staffMember;
	}
	



public String updateStaff(StaffMember staffMember){
	stmt = conn.dbConnect();
	//String verifyEmail = checkConsumerEmail(consumer);
	String query = "";
	boolean queryResult =true;
	//int code = (int)(Math.random()*10000);
	//String customCode = "cons"+code+"sid";
	//System.out.println("verifyEmail "+verifyEmail);
	//SendMail mailObj;
	//String mailStatus = "";
			
	try {
		System.out.println("Check Update Query-------------"+staffMember.getId());
		query = "UPDATE master_staff SET staff_code = '"+staffMember.getStaffCode()+"',"
				+ " first_name = '"+staffMember.getFirstname()+"' ,"
				+ " middle_name = '"+staffMember.getMiddlename()+"', "
				+ " last_name = '"+staffMember.getLastname()+"', "
				+ " date_of_birth = '"+(staffMember.getDob())+"', "
				+ " gender = '"+staffMember.getGender()+"', "
				+ " email = '"+staffMember.getEmail()+"', "
				+ " phoneNo = '"+staffMember.getPhoneNo()+"', "
				+ " address = '"+staffMember.getAddress()+"', "
				+ " message = '"+staffMember.getMessage()+"', "
				+ " other_details = '"+staffMember.getOtherDetails()+"'"
				/*+ " createdBy = '"+staffMember.getMiddlename()+"', "*/ + " where id = "+staffMember.getId()+"" ;
		/*query = "update master_staff set"
				+ "('"+staffMember.getStaffCode()+"',"
				+ "'"+staffMember.getFirstname()+"','"+staffMember.getMiddlename()+"','"+staffMember.getLastname()+"',"
						+ "'"+staffMember.getDob()+"',"
						+ "'"+staffMember.getGender()+"',"
						+ "'"+staffMember.getEmail()+"',"
						+ "'"+staffMember.getPassword()+"',"
						+ "'"+staffMember.getPhoneNo()+"',"
						+ "'"+staffMember.getAddress()+"',"
						+ "'"+staffMember.getMessage()+"',"
						+ "'"+staffMember.getOtherDetails()+"',"
						+ "'no','"+staffMember.getCreatedBy()+"',now(),null,null,null,null where id="")";*/
		System.out.println("registerNewStaff --insert Query --- "+query);
		queryResult = stmt.execute(query);
		queryResult = true;
		
	} catch (Exception e) {
		queryResult = false;
		e.printStackTrace();
	}
	if(queryResult == true){
		return "staff onboard successful";
	}
	else{
		return "staff onboarding Failed. Please create staff again or contact administrator";
	}
}
}
