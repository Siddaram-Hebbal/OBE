package com.minds.sid.database;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import org.omg.CORBA.Request;

import com.minds.sid.model.StaffCourseAssociation;
import com.minds.sid.model.StudentMember;
import com.minds.sid.model.StaffRole;
import com.minds.sid.model.BaseModel;
import com.minds.sid.model.StudentMember;
public class StudentTransaction {
	Statement stmt;
	ResultSet rs;
	DbConnection conn = new DbConnection();
	
	
	
	

	public LinkedList<StudentMember> getStudentList() {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		LinkedList<StudentMember> studentMembers = new LinkedList<StudentMember>();
		try {
			query = "Select * from master_student   where softDelete = 'no'";
			rs = stmt.executeQuery(query);
			studentMembers = setstudentMembersList(rs,studentMembers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentMembers;
	}
	
	
	public StudentMember getStudentDetailsById(int id) {
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		//BaseModel basemodel = new BaseModel();
		/*LinkedList<studentMember> studentMembers = new LinkedList<studentMember>();*/
		StudentMember studentMember = new StudentMember();
		try {
			query = "Select * from master_student   where id ="+id;
		
			ResultSet rs3 = stmt.executeQuery(query);
			studentMember = setStaffObjectById(rs3,studentMember);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentMember;
	}
	
	
	
	
	
	private LinkedList<StudentMember> setstudentMembersList(ResultSet rs2, LinkedList<StudentMember> studentMembers) {
		StudentMember studentMember = null;
		
		try
		{
			//id, staff_code, first_name, middle_name, last_name, date_of_birth, gender, email, password,
			//phoneNo, address, message, other_details, softDelete, createdBy, createdAt, deletedBy, deletedAt, modifiedBy, modifiedAt
			while(rs2.next()){
				studentMember = new StudentMember();
				studentMember.setId(rs2.getInt("id"));
				studentMember.setStudentAdmNo(rs2.getString("student_AdmNo"));
				studentMember.setFirstname(rs2.getString("first_name"));
				studentMember.setMiddlename(rs2.getString("middle_name"));
				studentMember.setLastname(rs2.getString("last_name"));
				studentMember.setGender(rs2.getString("gender"));
				studentMember.setDob(rs2.getDate("date_of_birth"));
				studentMember.setPhoneNo(rs2.getString("phoneNo"));
				studentMember.setEmail(rs2.getString("email"));
				studentMember.setPassword(rs2.getString("password"));
				studentMember.setAddress(rs2.getString("address"));
				studentMember.setMessage(rs2.getString("message"));
				studentMember.setOtherDetails(rs2.getString("other_details"));
				studentMember.setSoftDelete(rs2.getString("softDelete"));
				studentMember.setCreatedAt(rs2.getDate("createdAt"));
				studentMember.setCreatedBy(rs2.getString("createdBy"));
				studentMember.setDeletedAt(rs2.getDate("deletedAt"));
				studentMember.setDeletedBy(rs2.getString("deletedBy"));
				studentMember.setModifiedAt(rs2.getDate("modifiedAt"));
				studentMember.setModifiedBy(rs2.getString("modifiedBy"));
				studentMembers.add(studentMember);
				System.out.println("staff added to list");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return studentMembers;
	}

	
	public String createStudent(StudentMember studentMember){
		stmt = conn.dbConnect();
		//String verifyEmail = checkConsumerEmail(consumer);
		String query = "";
		boolean queryResult =true;
		UtilKlass util = new UtilKlass();
		//int code = (int)(Math.random()*10000);
		//String customCode = "cons"+code+"sid";
		//System.out.println("verifyEmail "+verifyEmail);
		//SendMail mailObj;
		//String mailStatus = "";
		
				
		try {
			query = "insert into master_student values"
					+ "(null,"
					+ "'"+studentMember.getStudentAdmNo()+"',"
					+ "'"+studentMember.getFirstname()+"','"+studentMember.getMiddlename()+"','"+studentMember.getLastname()+"',"
							+ "'"+studentMember.getDob()+"',"
							+ "'"+studentMember.getGender()+"',"
							+ "'"+studentMember.getEmail()+"',"
							+ "'"+studentMember.getPassword()+"',"
							+ "'"+studentMember.getPhoneNo()+"',"
							+ "'"+studentMember.getAddress()+"',"
							+ "'"+studentMember.getMessage()+"',"
							+ "'"+studentMember.getOtherDetails()+"',"
							+ "'no','"+studentMember.getCreatedBy()+"',now(),null,null,null,null)";
			System.out.println("registerNewStudent --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "Student Onboard Successful";
		}
		else{
			return "Student onboarding Failed. Please create Student again or contact administrator";
		}
		
	}
	
	public String verifyNewStudent(StudentMember studentMember) 
	{
		stmt = conn.dbConnect();
		String query = "select * from master_student where student_AdmNo = '"+studentMember.getStudentAdmNo()+"'";
		System.out.println("verifyStudent --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				if(rs.next())
				{
					return "Staff with the  code : "+studentMember.getStudentAdmNo()+" already exists. Do verify the staff details or contact administrator ";
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
	public String studentOnBoard(StudentMember studentMember) {
		String isStaffAvailable = verifyNewStudent(studentMember);
		if(isStaffAvailable.equalsIgnoreCase("valid")){
			String isStaffOnBoard = createStudent(studentMember);
			return isStaffOnBoard;
		}else
			return isStaffAvailable;
		
	}
	
	public String studentOnUpdate(StudentMember studentMember) {
		
		
			String isStudentOnUpdated = updateStudent(studentMember);
			return isStudentOnUpdated;
		
			
		
	}


	
	
	
	private StudentMember setStaffObjectById(ResultSet rs3, StudentMember studentMember){
		try
		{
			//id, staff_code, first_name, middle_name, last_name, date_of_birth, gender, email, password,
			//phoneNo, address, message, other_details, softDelete, createdBy, createdAt, deletedBy, deletedAt, modifiedBy, modifiedAt
			while(rs3.next()){
				studentMember.setId(rs3.getInt("id"));
				studentMember.setStudentAdmNo(rs3.getString("student_AdmNo"));
				studentMember.setFirstname(rs3.getString("first_name"));
				studentMember.setMiddlename(rs3.getString("middle_name"));
				studentMember.setLastname(rs3.getString("last_name"));
				studentMember.setGender(rs3.getString("gender"));
				studentMember.setDob(rs3.getDate("date_of_birth"));
				studentMember.setPhoneNo(rs3.getString("phoneNo"));
				studentMember.setEmail(rs3.getString("email"));
				studentMember.setPassword(rs3.getString("password"));
				studentMember.setAddress(rs3.getString("address"));
				studentMember.setMessage(rs3.getString("message"));
				studentMember.setOtherDetails(rs3.getString("other_details"));
				studentMember.setSoftDelete(rs3.getString("softDelete"));
				studentMember.setCreatedAt(rs3.getDate("createdAt"));
				studentMember.setCreatedBy(rs3.getString("createdBy"));
				studentMember.setDeletedAt(rs3.getDate("deletedAt"));
				studentMember.setDeletedBy(rs3.getString("deletedBy"));
				studentMember.setModifiedAt(rs3.getDate("modifiedAt"));
				studentMember.setModifiedBy(rs3.getString("modifiedBy"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return studentMember;
	}
	
	
	



public String updateStudent(StudentMember studentMember){
	stmt = conn.dbConnect();
	//String verifyEmail = checkConsumerEmail(consumer);
	String query = "";
	boolean queryResult =true;
	//int code = (int)(Math.random()*10000);
	//String customCode = "cons"+code+"sid";
	//System.out.println("verifyEmail "+verifyEmail);
	//SendMail mailObj;
	//String mailStatus = "";
	BaseModel basemodel = new  BaseModel();
	UtilKlass util = new UtilKlass();
			
	try {
		System.out.println("Check Update Query-------------"+studentMember.getId());
		query = "UPDATE master_student SET student_AdmNO = '"+studentMember.getStudentAdmNo()+"',"
				+ " first_name = '"+studentMember.getFirstname()+"' ,"
				+ " middle_name = '"+studentMember.getMiddlename()+"', "
				+ " last_name = '"+studentMember.getLastname()+"', "
				+ " date_of_birth = '"+(studentMember.getDob())+"', "
				+ " gender = '"+studentMember.getGender()+"', "
				+ " email = '"+studentMember.getEmail()+"', "
				+ " phoneNo = '"+studentMember.getPhoneNo()+"', "
				+ " address = '"+studentMember.getAddress()+"', "
				+ " message = '"+studentMember.getMessage()+"', "
				+ " other_details = '"+studentMember.getOtherDetails()+"'"
				/*+ " createdBy = '"+studentMember.getMiddlename()+"', "*/ + " where id = "+studentMember.getId()+"" ;
		/*query = "update master_staff set"
				+ "('"+studentMember.getStaffCode()+"',"
				+ "'"+studentMember.getFirstname()+"','"+studentMember.getMiddlename()+"','"+studentMember.getLastname()+"',"
						+ "'"+studentMember.getDob()+"',"
						+ "'"+studentMember.getGender()+"',"
						+ "'"+studentMember.getEmail()+"',"
						+ "'"+studentMember.getPassword()+"',"
						+ "'"+studentMember.getPhoneNo()+"',"
						+ "'"+studentMember.getAddress()+"',"
						+ "'"+studentMember.getMessage()+"',"
						+ "'"+studentMember.getOtherDetails()+"',"
						+ "'no','"+studentMember.getCreatedBy()+"',now(),null,null,null,null where id="")";*/
		System.out.println("registerNewStudent --insert Query --- "+query);
		queryResult = stmt.execute(query);
		queryResult = true;
		
	} catch (Exception e) {
		queryResult = false;
		e.printStackTrace();
	}
	if(queryResult == true){
		return "Student onboard successful";
	}
	else{
		return "Student onboarding Failed. Please create student again or contact administrator";
	}
}}
