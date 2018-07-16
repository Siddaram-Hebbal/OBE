package com.minds.sid.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import com.minds.sid.model.Course;
import com.minds.sid.model.CourseLearningOutcome;
import com.minds.sid.model.ProgramOutcomeType;

public class CourseTransaction {
	Statement stmt;
	ResultSet rs;
	DbConnection conn = new DbConnection();
	
	
	//getCourseByCourseCode
	public Course getCourseByCourseCode(String courseCode) {
		Course course = new Course();
		stmt = conn.dbConnect();
		boolean queryResult =true;
		String query = "select * from master_course where softDelete = 'no' and courseCode = '"+courseCode+"'";
		System.out.println("get master_course_learning_outcome --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			while(rs.next()){
				course = setCourseObject(rs);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return course;
	}
	
	//addCourseLearningOutcome
	public String addCourseLearningOutcome(CourseLearningOutcome learningOutcome){
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		try {
			query = "insert into master_course_learning_outcome values"
					+ "(null,'"+learningOutcome.getName()+"',"+learningOutcome.getCourseId()+","+learningOutcome.getPotId()+",'"+learningOutcome.getCloCode()+"','"+learningOutcome.getDescription()+"',"
							+ "'no','"+learningOutcome.getCreatedBy()+"',now(),null,null,null,null,null)";
			System.out.println("master_course_learning_outcome --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "Course Learning Outcome  addition is successful";
		}
		else{
			return "Course Learning Outcome  is not added . Please createCourse Learning Outcome  again or contact administrator";
		}
	}
	
	//getCourseLearningOutcomes
	public List<CourseLearningOutcome> getCourseLearningOutcomes(){
		List<CourseLearningOutcome> learningOutcomes = new LinkedList<CourseLearningOutcome>();
		CourseLearningOutcome outcome = null;
		stmt = conn.dbConnect();
		String query = "select * from master_course_learning_outcome where softDelete = 'no'";
		System.out.println("get master_course_learning_outcome --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			while(rs.next()){
				outcome = setCourseLearningOutcomeObject(rs);
				learningOutcomes.add(outcome);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return learningOutcomes;
	}

	
	private CourseLearningOutcome setCourseLearningOutcomeObject(ResultSet rs2) {
		CourseLearningOutcome outcome = new CourseLearningOutcome();
		try {
			outcome.setId(rs2.getInt("id"));
			outcome.setName(rs2.getString("name"));
			outcome.setPotId(rs2.getInt("potId"));
			outcome.setCourseId(rs2.getInt("courseId"));
			outcome.setCloCode(rs2.getString("cloCode"));
			outcome.setDescription(rs2.getString("description"));
			outcome.setSoftDelete(rs2.getString("softDelete"));
			outcome.setCreatedBy(rs2.getString("createdBy"));
			outcome.setCreatedAt(rs2.getDate("createdAt"));
			outcome.setDeletedBy(rs2.getString("deletedBy"));
			outcome.setDeletedAt(rs2.getDate("deletedAt"));
			outcome.setModifiedAt(rs2.getDate("modifiedAt"));
			outcome.setModifiedBy(rs2.getString("modifiedBy"));
			outcome.setFlag(rs2.getString("flag"));
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return outcome;
	}


	public List<ProgramOutcomeType> getProgramOutcomeTypes(){
		List<ProgramOutcomeType> programOutcomeTypes = new LinkedList<ProgramOutcomeType>();
		ProgramOutcomeType outcomeType = null;
		stmt = conn.dbConnect();
		String query = "select * from master_program_outcome_type where softDelete = 'no'";
		System.out.println("get master_program_outcome_type --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				outcomeType = new ProgramOutcomeType();
				outcomeType.setId(rs.getInt("id"));
				outcomeType.setPoCode(rs.getString("poCode"));
				outcomeType.setName(rs.getString("name"));
				outcomeType.setDescription(rs.getString("description"));
				outcomeType.setCreatedAt(rs.getDate("createdAt"));
				programOutcomeTypes.add(outcomeType);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return programOutcomeTypes;
	}
	
	public String addProgramOutcomeType(ProgramOutcomeType programOutcome){
		stmt = conn.dbConnect();
		String query = "";
		boolean queryResult =true;
		try {
			query = "insert into master_program_outcome_type values"
					+ "(null,'"+programOutcome.getName()+"','"+programOutcome.getPoCode()+"','"+programOutcome.getDescription()+"',"
							+ "'no','"+programOutcome.getCreatedBy()+"',now(),null,null,null,null,null)";
			System.out.println("program_outcome_type --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "Program Outcome Type addition is successful";
		}
		else{
			return "Program Outcome Type is not added . Please create Program Outcome Type again or contact administrator";
		}
	}
	
	public List<Course> getCoursesList(){
		List<Course> courses = new LinkedList<Course>();
		Course course = null;
		stmt = conn.dbConnect();
		String query = "select * from master_course where softDelete = 'no'";
		System.out.println("getCourses --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				course = new Course();
				course = setCourseObject(rs);
				courses.add(course);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return courses;
	}
	
	public Course getCourseByCourseId(int id){
		Course course = new Course();
		String query="";
		stmt = conn.dbConnect();
		query = "Select * from master_course where id ="+id;
		System.out.println("getCourses --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				course = new Course();
				course = setCourseObject(rs);
		
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return course;
	}
	private Course setCourseObject(ResultSet rs2) {
		Course course = new Course();
		try {
			course.setId(rs2.getInt("id"));
			course.setName(rs2.getString("name"));
			course.setCourseCode(rs2.getString("courseCode"));
			course.setDescription(rs2.getString("description"));
			course.setSoftDelete(rs2.getString("softDelete"));
			course.setCreatedBy(rs2.getString("createdBy"));
			course.setCreatedAt(rs2.getDate("createdAt"));
			course.setDeletedBy(rs2.getString("deletedBy"));
			course.setDeletedAt(rs2.getDate("deletedAt"));
			course.setModifiedBy(rs2.getString("modifiedBy"));
			course.setModifiedAt(rs2.getDate("modifiedAt"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return course;
	}

	public String createCourse(Course course){
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
			query = "insert into master_course values"
					+ "(null,'"+course.getName()+"','"+course.getCourseCode()+"','"+course.getDescription()+"',"
							+ "'no','"+course.getCreatedBy()+"',now(),null,null,null,null)";
			System.out.println("registerNewcourse --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "course onboard successful";
		}
		else{
			return "course onboarding Failed. Please create course again or contact administrator";
		}
		
	}
	
	
/*------------------Code By BASAVARAJ -----------------*****START***********--------------------------*/
	
	
	public String updateCourse(Course course){
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
			query = "UPDATE master_course SET name = '"+course.getName()+"',"
					
					+"courseCode ='"+course.getCourseCode()+"', "
					+"description ='"+course.getDescription()+"', "
					+"createdBy ='"+course.getCreatedBy()+"' "
					+ "where id = "+course.getId()+"";
			System.out.println("registerNewcourse --insert Query --- "+query);
			queryResult = stmt.execute(query);
			queryResult = true;
			
		} catch (Exception e) {
			queryResult = false;
			e.printStackTrace();
		}
		if(queryResult == true){
			return "course onboard successful";
		}
		else{
			return "course onboarding Failed. Please create course again or contact administrator";
		}
		
	}
	
	
	/*------------------Code By BASAVARAJ -----------------*****END***********--------------------------*/
	/*
*
* @author : Siddaram Hebbal
*
*
*/
	public String verifyNewCourse(Course course) 
	{
		stmt = conn.dbConnect();
		String query = "select * from master_course where courseCode = '"+course.getCourseCode()+"'";
		System.out.println("verifyCourse --SelectQuery --- "+query);
		try
		{
			rs = stmt.executeQuery(query);
			if(rs != null)
			{
				if(rs.next())
				{
					return "Course with the  code : "+course.getCourseCode()+" already exists. Do verify the course details or contact administrator ";
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
	
	public String courseOnBoard(Course course) {
		String isCourseAvailable = verifyNewCourse(course);
		if(isCourseAvailable.equalsIgnoreCase("valid")){
			String isCourseOnBoard = createCourse(course);
			return isCourseOnBoard;
		}else
			return isCourseAvailable;
		
	}
	
	
	/**
	 * 
	 * @author Baswaraj Chimmanchod
	 * */
	
	public String courseOnUpdate(Course course) {
			String isCourseOnUpdated = updateCourse(course);
			return isCourseOnUpdated;
	
		
	}
	/*-------------------------------Code By BASAVARAJ-------------*******START*************-------------------------------------------------*/
	
	
	
}
