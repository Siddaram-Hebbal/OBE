<%@page import="com.minds.sid.model.OrganisationMember"%>
<%@page import="com.minds.sid.database.OrganisationTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    	OrganisationTransaction transaction = new OrganisationTransaction();
    	OrganisationMember orgMember = new OrganisationMember();
    	
    	/* String str = request.getParameter();
    	int id = Integer.parseInt(str); */
    	
    	orgMember.setId(Integer.parseInt(request.getParameter("orgId")));
    	orgMember.setOrganisationname(request.getParameter("orgName"));
    	orgMember.setAddress((request.getParameter("orgAddress")));
    	
    	orgMember.setOtherDetails(request.getParameter("orgOtherDetails"));
    	orgMember.setCreatedBy("Admin");
    	
    	String isOrganisationUpdated = transaction.updateOrganisation(orgMember); 
    	System.out.println("isOrganisationUpdated --- "+isOrganisationUpdated);
    	
    	if(isOrganisationUpdated.equalsIgnoreCase("invalid") )
    	{
    		String message = "Please verify Course details and re enter again";
    		session.setAttribute("message", message);
    		response.sendRedirect("createOrganisation.jsp");
    		return;
    	}else{
    		orgMember = transaction.getOrgByOrgName(request.getParameter("orgName")); 
    		session.setAttribute("orgMember", orgMember);
    		session.setAttribute("message", isOrganisationUpdated);
    		session.setAttribute("step2","active");
    		response.sendRedirect("createOrganisation.jsp");
    		return;
    	}
    	
    	
    %>