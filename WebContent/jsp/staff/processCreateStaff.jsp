<%@page import="java.sql.Date"%>
<%@page import="com.minds.sid.database.UtilKlass"%>
<%-- <%@page import="java.util.Date"%> --%>
<%@page import="com.minds.sid.model.StaffMember"%>
<%@page import="com.minds.sid.database.StaffTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    	StaffTransaction transaction = new StaffTransaction();
    	StaffMember staffMember = new StaffMember();
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
    	staffMember.setFirstname(request.getParameter("firstName"));
    	 staffMember.setMiddlename(request.getParameter("middleName"));
    	staffMember.setLastname(request.getParameter("lastName"));
    	String dateOfBirth = request.getParameter("dob"); 
    	staffMember.setDob(util.toDate(dateOfBirth));
  //  staffMember.setDob((Date)dateOfBirth);
    	staffMember.setGender(request.getParameter("gender"));
    	staffMember.setPassword(request.getParameter("password"));
    	staffMember.setEmail(request.getParameter("email"));
    	staffMember.setStaffCode(request.getParameter("staffCode"));
    	staffMember.setPhoneNo(request.getParameter("phoneNo"));
    	staffMember.setMessage(request.getParameter("message")); 
    	
    	staffMember.setAddress(request.getParameter("address"));
    	staffMember.setOtherDetails(request.getParameter("otherDetails"));
    	staffMember.setCreatedBy("Admin");
    	
    	String isStaffOnBoarded = transaction.staffOnBoard(staffMember);  
    	System.out.println("isStaffOnBoarded --- "+isStaffOnBoarded);
    	
    	if(isStaffOnBoarded.equalsIgnoreCase("invalid") )
    	{
    		String message = "Please verify Staff details and re enter again";
    		session.setAttribute("message", message);
    		response.sendRedirect("createStaff.jsp");
    		return;
    	}else{
    		session.setAttribute("message", isStaffOnBoarded);
    		response.sendRedirect("createStaff.jsp");
    		return;
    	}
    	
    	
    %>