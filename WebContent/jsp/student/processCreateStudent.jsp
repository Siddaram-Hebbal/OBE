<%@page import="com.minds.sid.model.StudentMember"%>
<%@page import="com.minds.sid.database.StudentTransaction"%>

<%@page import="com.minds.sid.database.UtilKlass"%>
<%@page import="java.util.Date"%>
<%@page import="com.minds.sid.model.StudentMember"%>
<%@page import="com.minds.sid.database.StaffTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    	StudentTransaction transaction = new StudentTransaction();
        StudentMember studentMember = new StudentMember();
    	UtilKlass util = new UtilKlass();
    	/* 
	private String middlename;
	private String lastname;
	private String dob;
	private String gender;
	private String password;
	private String email;
	private String staffCode;
	private String phoneNo;
	private String message;
	private String address;
	private String otherDetails;
    	 */
    	studentMember.setFirstname(request.getParameter("firstName"));
    	studentMember.setMiddlename(request.getParameter("middleName"));
    	studentMember.setLastname(request.getParameter("lastName"));
    	String dateOfBirth = request.getParameter("dob"); 
    	studentMember.setDob(util.toDate(dateOfBirth));
    	studentMember.setGender(request.getParameter("gender"));
    	studentMember.setPassword(request.getParameter("password"));
    	studentMember.setEmail(request.getParameter("email"));
    	studentMember.setStudentAdmNo(request.getParameter("studentAdmNo"));
    	studentMember.setPhoneNo(request.getParameter("phoneNo"));
    	studentMember.setMessage(request.getParameter("message")); 
    	
    	studentMember.setAddress(request.getParameter("address"));
    	studentMember.setOtherDetails(request.getParameter("otherDetails"));
    	studentMember.setCreatedBy("Admin");
    	
    	String isStudentOnBoarded = transaction.studentOnBoard(studentMember);  
    	System.out.println("isStudentOnBoarded --- "+isStudentOnBoarded);
    	
    	if(isStudentOnBoarded.equalsIgnoreCase("invalid") )
    	{
    		String message = "Please verify Staff details and re enter again";
    		session.setAttribute("message", message);
    		response.sendRedirect("createStudent.jsp");
    		return;
    	}else{
    		session.setAttribute("message", isStudentOnBoarded);
    		response.sendRedirect("createStudent.jsp");
    		return;
    	}
    	
    	
    %>