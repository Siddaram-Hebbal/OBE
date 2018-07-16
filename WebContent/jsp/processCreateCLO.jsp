<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@page import="com.minds.sid.model.CourseLearningOutcome"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    CourseLearningOutcome learningOutcome = new CourseLearningOutcome();
    CourseTransaction transaction = new CourseTransaction();
    learningOutcome.setName(request.getParameter("name"));
    learningOutcome.setCourseId(Integer.parseInt(request.getParameter("courseId"))); 
    learningOutcome.setPotId(Integer.parseInt(request.getParameter("potId")));
    learningOutcome.setCloCode(request.getParameter("cloCode"));
    learningOutcome.setDescription(request.getParameter("description"));
    learningOutcome.setCreatedBy("");
	
	String isLearningOutcomeAdded = transaction.addCourseLearningOutcome(learningOutcome);  
	System.out.println("isLearningOutcomeAdded --- "+isLearningOutcomeAdded);
    	
    	List<CourseLearningOutcome> learningOutcomes = transaction.getCourseLearningOutcomes();  
    	
    	Iterator<CourseLearningOutcome> it = learningOutcomes.iterator();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../mdb/datatable/dataTables.bootstrap4.min.css"/>
	<link rel="stylesheet" type="text/css" href="../mdb/datatable/datatable.css"/>
</head>
<body>
	
	<%
								if(learningOutcomes!=null){
									%>
								
                               <!--  <h4 class="card-title">Program Outcome Types</h4> -->
                                <!-- <h6 class="card-subtitle">Add class <code>.table</code></h6> -->
                               
                                <table id="cloTable" class="table table-striped table-bordered table-responsive-md" cellspacing="0" width="100%">
								    <thead>
								        <tr>
                                                <th class="">CLO Id</th>
                                                <th class="">CLO Type</th>
                                                <th >Created At</th>
                                                <th class="">CLO Description</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
									<%
									try {
									while(it.hasNext()){
										CourseLearningOutcome outcome = it.next();
										%>
										<tr>
                                                <td  class="mdl-data-table__cell--non-numeric"><%=outcome.getCloCode() %></td>
                                                <td  class="mdl-data-table__cell--non-numeric"><%=outcome.getName() %></td>
                                                <td  ><%=outcome.getCreatedAt() %></td>
                                                <td  class="mdl-data-table__cell--non-numeric"><%=outcome.getDescription() %></td>
                                            </tr>
                                           
										<%
									}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
									 </tbody>
                                    </table>
									
                    		
                          
									<%
								}
									%>
								<div class="col-12">	
									<%if(isLearningOutcomeAdded != null){ %>
                    	<%-- <c:if test="${message} != null"> --%>
							<div class="card">
                            	<div class="card-block bg-info" style="color:white;">
                            	<%-- <c:out value="${sessionScope['message']}"></c:out> --%>
                            		<%=isLearningOutcomeAdded %>
                            			 
								</div>
							</div>	  
							
							<%} 
							session.setAttribute("isLearningOutcomeAdded", null);
							%>              
									</div>
									
<!-- https://mdbootstrap.com/content/tables/ -->
<script src="../mdb/datatable/jquery.dataTables.min.js"></script>
	<script src="../mdb/datatable/dataTables.bootstrap4.min.js"></script>	
	<script type="text/javascript">

	 $(document).ready(function() {
    			 
         $('#cloTable').DataTable();
         $('.dataTables_wrapper').find('label').each(function() {
           $(this).parent().append($(this).children());
         });
         $('select').addClass('mdb-select');
         $('.mdb-select').material_select();
     });
	</script>
	
</body>
</html>