package com.minds.sid.database;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import com.minds.sid.model.Course;
import com.minds.sid.model.OrganisationMember;
import com.minds.sid.model.StaffRole;
import com.minds.sid.model.University;


public class OrganisationTransaction {
	
	Statement stmt;
	ResultSet rs;
	DbConnection conn = new DbConnection();
	
	
/*-------------------BY BASAVARAJ-----------******START*******_-----------------------------------------------*/
	
	public List<OrganisationMember> getOrganisationsList(){
		List<OrganisationMember> orgMembers = new LinkedList<OrganisationMember>();
		OrganisationMember orgMember = null;
		stmt = conn.dbConnect();
		String query = "select * from master_organisations where softDelete = 'no'";
		System.out.println("getCourses --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				orgMember = new OrganisationMember();
				orgMember = setOrgObject(rs);
				orgMembers.add(orgMember);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return orgMembers;
	}
	
	/*-------------------BY BASAVARAJ-----------*******END******_-----------------------------------------------*/
	
	
	
	
	/*-------------------BY BASAVARAJ-----------********START*****_-----------------------------------------------*/
	
	
	public OrganisationMember getOrganisationByOrgId(int id){
		OrganisationMember orgMembers = new OrganisationMember();
		OrganisationMember orgMember = null;
		stmt = conn.dbConnect();
		String query = "select * from master_organisations where organisation_id ="  +id ;
		System.out.println("getCourses --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				orgMember = new OrganisationMember();
				orgMember = setOrgObject(rs);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return orgMember;
	}
	
	/*-------------------BY BASAVARAJ-----------*******END******_-----------------------------------------------*/
	
	
	public String verifyNewOrganisation(OrganisationMember orgMember) 
	{
		stmt = conn.dbConnect();
		String query = "select * from master_organisations where organisation_name = '"+orgMember.getOrganisationname()+"'";
		System.out.println("verifyOrganisations --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				if(rs.next())
				{
					return "Organisations with the registration code : "+orgMember.getOrganisationname()+" already exists. Do verify the Organisations details or contact administrator ";
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
	
	public String registerNewOrganisation(OrganisationMember orgMember){
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
			query = "insert into master_organisations values"
					+ "(null,"
					+ "'"+orgMember.getOrganisationname()+"',"
							+ "'"+orgMember.getAddress()+"',"
									+ "'"+orgMember.getOtherDetails()+"',"
											
							+ "'no','"+orgMember.getCreatedBy()+"',now(),null,null,null,null)";
			
			
			System.out.println("registerNewUniversity --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "Organisation onboard successful";
		}
		else{
			return "Organisation onboarding Failed. Please create Organisation again";
		}
		
	}
	public String organisationOnBoard(OrganisationMember orgMember) {
		String isOrganisationAvailable = verifyNewOrganisation(orgMember);
		if(isOrganisationAvailable.equalsIgnoreCase("valid")){
			String isOrganisationOnBoard =	registerNewOrganisation(orgMember);
			return isOrganisationOnBoard;
		}else
			return isOrganisationAvailable;
		
	}
	
	
	/*-------------------BY BASAVARAJ-----------*******START******_-----------------------------------------------*/
	
	private OrganisationMember setOrgObject(ResultSet rs2) {
		OrganisationMember orgMember = new OrganisationMember();
		try {
			orgMember.setId(rs2.getInt("organisation_id"));
			orgMember.setOrganisationname(rs2.getString("organisation_name"));
			orgMember.setAddress(rs2.getString("address"));
			orgMember.setOtherDetails(rs2.getString("other_details"));
			orgMember.setSoftDelete(rs2.getString("softDelete"));
			orgMember.setCreatedBy(rs2.getString("createdBy"));
			orgMember.setCreatedAt(rs2.getDate("createdAt"));
			orgMember.setDeletedBy(rs2.getString("deletedBy"));
			orgMember.setDeletedAt(rs2.getDate("deletedAt"));
			orgMember.setModifiedBy(rs2.getString("modifiedBy"));
			orgMember.setModifiedAt(rs2.getDate("modifiedAt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orgMember;
	}
	
/*-------------------BY BASAVARAJ-----------*******END******_-----------------------------------------------*/
	
	
/*------------------ By BASAVARAJ -----------------*****START***********------------------------------------*/
	
	
	public String updateOrganisation(OrganisationMember orMember){
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
			query = "UPDATE master_organisations SET organisation_name = '"+orMember.getOrganisationname()+"',"
					
					+"address ='"+orMember.getAddress()+"', "
					+"other_details ='"+orMember.getOtherDetails()+"', "
					+"createdBy ='"+orMember.getCreatedBy()+"' "
					+ "where organisation_id = "+orMember.getId()+"";
			
			
			
			System.out.println("registerNewcourse --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "Organisation Osnboard Successful";
		}
		else{
			return "course onboarding Failed. Please create course again or contact administrator";
		}
		
	}
	
	
	/*------------------Code By BASAVARAJ -----------------*****END***********--------------------------*/
	
	
	

	
	
	/*------------------ By BASAVARAJ -----------------*****START***********------------------------------------*/
	
	public OrganisationMember getOrgByOrgName(String organisation_name) {
		OrganisationMember orgMember= new OrganisationMember();
		stmt = conn.dbConnect();
		boolean queryResult =true;
		String query = "select * from master_organisations where softDelete = 'no' and organisation_name = '"+organisation_name+"'";
		System.out.println("get master_organisation --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			while(rs.next()){
				orgMember = setOrgObject(rs);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return orgMember;
	}
	
	
	/*-------------------BY BASAVARAJ-----------*******END******_-----------------------------------------------*/
	
}
