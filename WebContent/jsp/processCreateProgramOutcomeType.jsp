<%@page import="com.minds.sid.model.ProgramOutcomeType"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    	CourseTransaction transaction = new CourseTransaction();
    	ProgramOutcomeType poType = new ProgramOutcomeType();
    	
    	poType.setName(request.getParameter("name"));
    	poType.setPoCode(request.getParameter("poCode"));
    	
    	poType.setDescription(request.getParameter("description"));
    	poType.setCreatedBy("");
    	
    	String addPOType = transaction.addProgramOutcomeType(poType);  
    	System.out.println("addPOType --- "+addPOType);
    	
    	if(addPOType.equalsIgnoreCase("invalid") )
    	{
    		String message = "Please verify Program Outcome Type and re enter again";
    		session.setAttribute("message", message);
    		response.sendRedirect("createProgramOutcomeType.jsp");
    		return;
    	}else{
    		session.setAttribute("message", addPOType);
    		response.sendRedirect("createProgramOutcomeType.jsp");
    		return;
    	}
    	
    	
    %>