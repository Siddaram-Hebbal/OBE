<%@page import="com.minds.sid.model.CourseLearningOutcome"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.minds.sid.model.ProgramOutcomeType"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
		String message = (String)session.getAttribute("message");
		CourseTransaction transaction = new CourseTransaction();	
	//	int courseId = (Integer.parseInt(request.getAttribute("courseId").toString()));
	//	int courseId ;
		List<Course> courses =  transaction.getCoursesList();  
		Iterator<Course> itCourses = courses.iterator();
		
		List<ProgramOutcomeType> programOutcomeTypes = transaction.getProgramOutcomeTypes(); 
    	Iterator<ProgramOutcomeType> itPOT = programOutcomeTypes.iterator();
    	
	List<CourseLearningOutcome> learningOutcomes = transaction.getCourseLearningOutcomes();  
    	
    	Iterator<CourseLearningOutcome> it = learningOutcomes.iterator();
		
%>
<html>

<head>
	
</head>

<body class="fix-header fix-sidebar card-no-border">
	
	  <jsp:include page="headResource.jsp"></jsp:include>
		
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
       <jsp:include page="sidebarAdmin.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor">Dashboard</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="courseBoard.jsp">Course Board</a></li>
                            <li class="breadcrumb-item active">Create Course Learning Outcomes</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                         <a href="courseBoard.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> View Courses</a> 
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row   -->
                
                <div class="row">
                    <div class="col-12" id=courseLearningOutcomeDiv>
                    	<%
								if(learningOutcomes!=null){
									%>
								
                               <!--  <h4 class="card-title">Program Outcome Types</h4> -->
                                <!-- <h6 class="card-subtitle">Add class <code>.table</code></h6> -->
                               
                                <table id="cloTable1" class="table table-striped table-bordered table-responsive-md table-hover" cellspacing="0" width="100%">
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
                                                <td>
													<!-- Right aligned menu below button -->
													<button id="<%=outcome.getId()%>"
														class="mdl-button mdl-js-button mdl-button--icon">
														<i class="material-icons">menu</i>
													</button>

													<ul
														class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
														for="<%=outcome.getId()%>">
														<li class="mdl-menu__item" title="Add Lecture Objectives"><a href="createLectureObjectives.jsp?courseId=<%=outcome.getId()%>">Add LO</a></li>
														<li class="mdl-menu__item" title="View Lecture Objectives">View LO</li>
														<!-- <li disabled class="mdl-menu__item">Disabled Action</li>
														<li class="mdl-menu__item">Yet Another Action</li> -->
													</ul>
												</td>
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
                	</div>
                </div>
                
                <div class="row">
                    <div class="col-12">
                    		<%if(message != null){ %>
                    	<%-- <c:if test="${message} != null"> --%>
							<div class="card">
                            	<div class="card-block bg-info" style="color:white;">
                            	<%-- <c:out value="${sessionScope['message']}"></c:out> --%>
                            		<%=message %>
                            			 
								</div>
							</div>	  
							<%} 
							session.setAttribute("message", null);
							%>                  	
                    	<%-- </c:if> --%>
                        <div class="card">
                            <div class="card-block">
                                <form id="createCLO" class="form-horizontal form-material" action="processCreateCLO.jsp" method="post">
                               	   <div class="form-group">
	                                    <label class="col-md-12">Course Id</label>
    	                                <div class="col-md-12">
        			                        <select class="form-control form-control-line" name="courseId">
											    <option value="" disabled selected >Choose your option</option>
											    <%
											    	while(itCourses.hasNext()){
											    	Course course = itCourses.next();
											    		%>
											    	<option value="<%=course.getId()%>"><%=course.getCourseCode() %></option>
											    		<%
											    	}
											  
											    %>
											 
											</select>
			                            </div>
                                   </div>
                                   <div class="form-group">
	                                    <label class="col-md-12">Program Outcome Type Id</label>
    	                                <div class="col-md-12">
        			                        <select class="form-control form-control-line" name="potId">
											    <option value="" disabled selected>Choose your option</option>
											    <%
											    	while(itPOT.hasNext()){
											    	ProgramOutcomeType outcomeType = itPOT.next();
											    	
											    %>
											    	<option  value="<%=outcomeType.getId()%>"><%=outcomeType.getPoCode() %></option>
											    <%
											    	}
											    	
											    %>
											 
											</select>
			                            </div>
                                   </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">Course Learning Outcome - Name</label>
                                        <div class="col-md-12">
                                            <input placeholder="course name" class="form-control form-control-line" type="text" id="name" name="name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">CLO Code</label>
                                        <div class="col-md-12">
                                            <input placeholder="course code" class="form-control form-control-line" type="text" id="cloCode" name="cloCode">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">CLO Description</label>
                                        <div class="col-md-12">
                                            <textarea rows="4" class="form-control form-control-line" id="description" name="description"></textarea>
                                        </div>
                                    </div>
                                    <!-- <div class="form-group">
                                        <label class="col-sm-12">Select Country</label>
                                        <div class="col-sm-12">
                                            <select class="form-control form-control-line">
                                                <option>London</option>
                                                <option>India</option>
                                                <option>Usa</option>
                                                <option>Canada</option>
                                                <option>Thailand</option>
                                            </select>
                                        </div>
                                    </div> -->
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <!-- <button class="btn btn-success">Submit University Details</button> -->
                                            <input class="btn btn-success" id="cloButton" type="button" value="Submit Course Learning Outcome">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
           
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
         <!-- footer -->
            <!-- ============================================================== -->
         	<jsp:include page="footer.jsp"></jsp:include>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
    </div>
    
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
     <jsp:include page="scriptResource.jsp"></jsp:include>
    

	
	 <script type="text/javascript">
	     $(document).ready(function() {
	    		     
	    	 var data;
    	    data = $('#createCLO').serialize();
	    	 $("#cloButton").click(function(){
	   		  $.ajax(
	   	    		  {
	       	    		  url: "processCreateCLO.jsp",
	       	    		  data: data,
	       	    		  success: function(result)
	       	    		  {
			    		        $("#courseLearningOutcomeDiv").html(result);
	   					  }
						  });
	       	  });
	  		 
       
     });
	</script>
     <script type="text/javascript">

	 $(document).ready(function() {
    			 
         $('#cloTable1').DataTable({
        	 "pageLength": 5
        	/*  dom: 'lrtip',
        	 "paging":   true,
             "ordering": true,
             "info":     true */
             });
         $('.dataTables_wrapper').find('label').each(function() {
           $(this).parent().append($(this).children());
         });
         $('select').addClass('mdb-select');
         $('.mdb-select').material_select();
     });
	</script>
	
</body>

</html>