<%@page import="com.minds.sid.model.StaffRole"%>
<%@page import="com.minds.sid.database.StaffTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    	StaffTransaction transaction = new StaffTransaction();
    	StaffRole role = new StaffRole();
    	/* 	private String roleCode;
	private String roleName;
	private String roleDescription; */
    	role.setRoleCode(request.getParameter("roleCode"));
    	role.setRoleName(request.getParameter("roleName"));
    	
    	role.setRoleDescription(request.getParameter("roleDescription"));
    	role.setCreatedBy("Admin");
    	
    	String isStaffRoleOnBoarded = transaction.staffRoleOnBoard(role); 
    	System.out.println("isStaffRoleOnBoarded  --- "+isStaffRoleOnBoarded );
    	
    	if(isStaffRoleOnBoarded.equalsIgnoreCase("invalid") )
    	{
    		String message = "Please verify Staff-Role details and re enter again";
    		session.setAttribute("message", message);
    		response.sendRedirect("createStaffRoles.jsp");
    		return;
    	}else{
    		session.setAttribute("message", isStaffRoleOnBoarded);
    		response.sendRedirect("createStaffRoles.jsp");
    		return;
    	}
    	
    	
    %>