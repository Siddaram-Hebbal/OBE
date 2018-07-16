
<%@page import="com.minds.sid.database.StaffTransaction"%>
<%@page import="com.minds.sid.database.UtilKlass"%>
<%@page import="java.sql.Date"%>
<%@page import="com.minds.sid.model.StaffCourseAssociation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
UtilKlass util = new UtilKlass();
StaffCourseAssociation association = new StaffCourseAssociation();
StaffTransaction staffTransaction = new StaffTransaction();

int	courseIdSelected = Integer.parseInt(request.getParameter("courseIdSelected"));
int	staffIdSelected = Integer.parseInt(request.getParameter("staffIdSelected"));
int	reportsToStaffId = Integer.parseInt(request.getParameter("reportsToStaffId"));
int	staffRoleId = Integer.parseInt(request.getParameter("staffRoleId"));
String dateFrom = request.getParameter("dateFrom");
String	dateTo = request.getParameter("dateTo");
int		orgUnitId = Integer.parseInt(request.getParameter("orgUnitId"));
String	otherDetails = request.getParameter("otherDetails");
String createdBy = "Admin";


association.setOrgUnitId(orgUnitId);
association.setStaffId(staffIdSelected);
association.setReportsToStaffId(reportsToStaffId);
association.setCourseId(courseIdSelected);
association.setRoleId(staffRoleId);
association.setDateFrom(util.toDate(dateFrom));
association.setDateTo(util.toDate(dateTo));
association.setOtherDetails(otherDetails);
association.setCreatedBy(createdBy);
String isCourseAllocated  = "valid";
//String isCourseAllocated  = staffTransaction.associateCourseStaff(association);
System.out.println("isCourseAllocated --- "+isCourseAllocated);

if(isCourseAllocated.equalsIgnoreCase("invalid") )
{
	String message = "Please verify Course Allocation details and re enter again";
	 session.setAttribute("message", message);
	response.sendRedirect("step2AddCourseAssociation.jsp");
	 
}else{
	session.setAttribute("message", isCourseAllocated);
	 response.sendRedirect("step2AddCourseAssociation.jsp");
	 
}
    	
		
%>
