<%@page import="com.minds.sid.model.OrganisationMember"%>
<%@page import="com.minds.sid.database.OrganisationTransaction"%>
<%@page import="com.minds.sid.database.UtilKlass"%>
<%@page import="java.util.Date"%>
<%@page import="com.minds.sid.model.StaffMember"%>
<%@page import="com.minds.sid.database.StaffTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	OrganisationTransaction transaction = new OrganisationTransaction();
	OrganisationMember orgMember = new OrganisationMember();
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
	orgMember.setOrganisationname(request.getParameter("orgName"));
	orgMember.setOtherDetails(request.getParameter("orgOtherDetails"));
	orgMember.setAddress(request.getParameter("orgAddress"));
	

	String isOrgOnBoarded = transaction.organisationOnBoard(orgMember);
	System.out.println("isStaffOnBoarded --- " + isOrgOnBoarded);

	if (isOrgOnBoarded.equalsIgnoreCase("invalid")) {
		String message = "Please verify Staff details and re enter again";
		session.setAttribute("message", message);
		response.sendRedirect("createOrganisation.jsp");
		//return;
	} else {
		session.setAttribute("message", isOrgOnBoarded);
		response.sendRedirect("createOrganisation.jsp");
		//return;
	}
%>