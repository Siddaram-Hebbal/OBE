package com.minds.sid.database;

import java.sql.ResultSet;
import java.sql.Statement;

import com.minds.sid.model.University;


public class UniversityTransaction {
	
	Statement stmt;
	ResultSet rs;
	DbConnection conn = new DbConnection();
	
	public University getUniversity() {
		University university = null;
		stmt = conn.dbConnect();
		String query = "select * from master_university";
		System.out.println("get university --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				university = new University();
				if(rs.next())
				{
					university.setAddress(rs.getString("address"));
					university.setDescription(rs.getString("description"));
					university.setName(rs.getString("name"));
					university.setEmail(rs.getString("email"));
					university.setRegistrationCode(rs.getString("registrationCode"));
					university.setWebsite(rs.getString("website"));
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return university;
		
	}
	
	public String verifyNewUniversity(University university) 
	{
		stmt = conn.dbConnect();
		String query = "select * from master_university where registrationCode = '"+university.getRegistrationCode()+"'";
		System.out.println("verifyUniversity --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				if(rs.next())
				{
					return "University with the registration code : "+university.getRegistrationCode()+" already exists. Do verify the university details or contact administrator ";
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
	
	public String registerNewUniversity(University university){
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
			query = "insert into master_university values"
					+ "(null,'"+university.getName()+"','"+university.getRegistrationCode()+"','"+university.getContact()+"','"+university.getEmail()+"',"
						+ "'"+university.getWebsite()+"','"+university.getAddress()+"','"+university.getDescription()+"',"
							+ "'no','"+university.getCreatedBy()+"',now(),null,null,null,null)";
			System.out.println("registerNewUniversity --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "University onboard successful";
		}
		else{
			return "University onboarding Failed. Please create university again";
		}
		
	}
	public String universityOnBoarding(University university) {
		String isUniversityAvailable = verifyNewUniversity(university);
		if(isUniversityAvailable.equalsIgnoreCase("valid")){
			String isUniversityOnBoard =	registerNewUniversity(university);
			return isUniversityOnBoard;
		}else
			return isUniversityAvailable;
		
	}
	
	
	
}
