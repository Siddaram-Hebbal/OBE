<%@page import="com.minds.sid.model.Course"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
    	CourseTransaction transaction = new CourseTransaction();
    	Course course = new Course();
    	
    	course.setName(request.getParameter("courseName"));
    	course.setCourseCode(request.getParameter("courseCode"));
    	
    	course.setDescription(request.getParameter("description"));
    	course.setCreatedBy("Admin");
    	
    	String isCourseOnBoarded = transaction.courseOnBoard(course); 
    	System.out.println("isCourseOnBoarded --- "+isCourseOnBoarded);
    	
    	if(isCourseOnBoarded.equalsIgnoreCase("invalid") )
    	{
    		String message = "Please verify Course details and re enter again";
    		session.setAttribute("message", message);
    		response.sendRedirect("createCourse.jsp");
    		return;
    	}else{
    		course = transaction.getCourseByCourseCode(request.getParameter("courseCode")); 
    		session.setAttribute("course", course);
    		session.setAttribute("message", isCourseOnBoarded);
    		session.setAttribute("step2","active");
    		response.sendRedirect("createCourse.jsp");
    		return;
    	}
    	
    	
    %>