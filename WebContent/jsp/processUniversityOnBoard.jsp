<%@page import="com.minds.sid.model.University"%>
<%@page import="com.minds.sid.database.UniversityTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    	UniversityTransaction transaction = new UniversityTransaction();
    	University university = new University();
    	
    	university.setName(request.getParameter("name"));
    	university.setRegistrationCode(request.getParameter("registrationCode"));
    	university.setContact(request.getParameter("contact"));
    	university.setEmail(request.getParameter("email"));
    	university.setWebsite(request.getParameter("website"));
    	university.setAddress(request.getParameter("address"));
    	university.setDescription(request.getParameter("description"));
    	university.setCreatedBy("");
    	
    	String isUniversityOnBoarded = transaction.universityOnBoarding(university); 
    	System.out.println("isUniversityOnBoarded --- "+isUniversityOnBoarded);
    	
    	if(isUniversityOnBoarded.equalsIgnoreCase("invalid") )
    	{
    		String message = "Please verify University details and re enter again";
    		session.setAttribute("message", message);
    		response.sendRedirect("universityOnBoard.jsp");
    		return;
    	}else{
    		session.setAttribute("message", isUniversityOnBoarded);
    		response.sendRedirect("universityOnBoard.jsp");
    		return;
    	}
    	
    	
    %>