<%@page import="java.util.Iterator"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
		String message = (String)session.getAttribute("message");
    	CourseTransaction transaction = new CourseTransaction();	
    	List<Course> courses =  transaction.getCoursesList();  
    	Iterator<Course> it = courses.iterator(); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<style type="text/css">
		
		.table-responsive {
	display: block;
	width: 100%;
	height: 100%;
	overflow-x: inherit;
	-ms-overflow-style: -ms-autohiding-scrollbar;
}
	</style>
</head>

<body class="fix-header fix-sidebar card-no-border">
	<jsp:include page="../elements/headResource.jsp"></jsp:include>
	
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />  </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <jsp:include page="../elements/header.jsp"></jsp:include>
        <!-- =========================	===================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
       <jsp:include page="../elements/sidebarAdmin.jsp"></jsp:include>
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
                        <h3 class="text-themecolor">Course Board</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="dashboardAdmin.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Course Board</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                         <a href="../course/createCourse.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> Create Course</a> 
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
				 <!-- Row -->
				  <div class="row">
					<div class="col-4">
						<div class="card">
							<div class="card-block bg-info">
								<!-- <div class="content-grid mdl-grid">
						      		<div class="mdl-cell "> -->
										<h4 class="text-white card-title">Program Outcomes : 7</h4>
										<h6 class="card-subtitle text-white m-b-0 op-5">PO Summary</h6>
									<!-- </div>
								</div> -->
							</div>
							<div class="card-block">
								<div class="message-box contact-box">
									<h2 class="add-ct-btn">
										<!-- <button type="button"
											class="btn btn-circle btn-lg btn-success waves-effect waves-dark">+</button> -->
									</h2>
									<div class="message-widget contact-widget">
										
										<!-- Message -->
										<a href="../createProgramOutcomeType.jsp">
											<div class="">
												
											</div>
											<div class="">
												<span class="">Create PO</span>
												<!-- <span class="mail-desc">Add New Program Outcome Type</span> -->
											</div>
										</a>
											<!-- Message -->
										<a href="#">
											<div class="user-img">
												
											</div>
											<div class="">
												
												<span id="viewPO" data-toggle="modal" data-target="#exampleModal">View POs</span>
												<!-- <span class="mail-desc">View Program Outcome Type</span> -->
											</div>
										</a>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-block bg-info">
								<h4 class="text-white card-title">Courses : 3</h4>
								<h6 class="card-subtitle text-white m-b-0 op-5">Courses Summary</h6>
							</div>
							
							<div class="card-block">
								<div class="message-box contact-box">
									<h2 class="add-ct-btn">
										<!-- <button type="button"
											class="btn btn-circle btn-lg btn-success waves-effect waves-dark">+</button> -->
									</h2>
									<div class="message-widget contact-widget">
										
										<!-- Message -->
										<a href="../course/createCourse.jsp">
											<div class="user-img">
											</div>
											<div class="">
												<span class="">Create Course</span>
											</div>
										</a>
										<a href="../course/viewCourses.jsp">
											<div class="user-img">
											</div>
											<div class="">
												<span class="">View Courses</span>
											</div>
										</a>
							

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="card">
							<div class="card-block bg-info">
								<!-- <div class="content-grid mdl-grid">
						      		<div class="mdl-cell "> -->
										<h4 class="text-white card-title">Staff Associations : 3</h4>
										<h6 class="card-subtitle text-white m-b-0 op-5">Staff-Course Summary</h6>
									<!-- </div>
								</div> -->
							</div>
							<div class="card-block">
								<div class="message-box contact-box">
									<h2 class="add-ct-btn">
										
									</h2>
									<div class="message-widget contact-widget">
										<a href="../associations/step2AddCourseAssociation.jsp">
											<div class="user-img">
											</div>
											<div class="">
												<span class="">Allocate Course</span>
											</div>
										</a>	
										<a href="../associations/viewStaffCourseAssociation.jsp">
											<div class="user-img">
											</div>
											<div class="">
												<span class="">View Staff-Course Association</span>
											</div>
										</a>	
							
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                        
				<!-- Row -->
                <div class="row">
                    <div class="col-12">
                    	<%
                    		if(message != null){
                    	%>
                    	<%-- <c:if test="${message} != null"> --%>
							<div class="card">
                            	<div class="card-block bg-info" style="color:white;">
                            	<%-- <c:out value="${sessionScope['message']}"></c:out> --%>
                            		<%=message%>
                            			 
								</div>
							</div>	  
							<%} 
							session.setAttribute("message", null);
							%>   
							<%
								if(courses!=null){
									%>
									<div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Courses</h4>
                                <!-- <h6 class="card-subtitle">Add class <code>.table</code></h6> -->
                                <div class="table-responsive" style="height: 100%;overflow-x: inherit;">
                                	<table id="courseListTable" class="table table-striped table-bordered table-responsive-md">
                                        <thead>
                                            <tr>
                                                <th>Course Code</th>
                                                <th>Course Name</th>
                                                <th>Created At</th>
                                                <th>Course Description</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
									<%
									try {
									while(it.hasNext()){
										Course course = it.next();
										%>
										<tr>
                                                <td><%=course.getCourseCode() %></td>
                                                <td><%=course.getName() %></td>
                                                <td><%=course.getCreatedAt() %></td>
                                                <td><%=course.getDescription() %></td>
                                                <td>
													<!-- Right aligned menu below button -->
													<button id="<%=course.getId()%>"
														class="mdl-button mdl-js-button mdl-button--icon">
														<i class="material-icons">menu</i>
													</button>

													<ul
														class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
														for="<%=course.getId()%>">
														<li class="mdl-menu__item"><a href="../createCLO.jsp?courseId=<%=course.getId()%>">Add CLO</a></li>
														<li class="mdl-menu__item">Another Action</li>
														<li disabled class="mdl-menu__item">Disabled Action</li>
														<li class="mdl-menu__item">Yet Another Action</li>
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
									</div>
                            </div>
                       </div> 
									<%
								}
									%>
								
                        
                       </div>       
                <!-- Row -->
                
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
          
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
             </div>
          <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Program Outcome Types</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"  id="programOutcomeTypeDetails">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>   
             
    <!--   <div id="modal" class="modal modal__bg ">
        <div class="modal__dialog">
          <div class="modal__content">
            <div class="modal__header">
              <div class="modal__title">
                <h2 class="modal__title-text">Program Outcome Types</h2>
              </div>

              <span class="mdl-button mdl-button--icon mdl-js-button  material-icons  modal__close"></span>
            </div>


            <div class="modal__text" id="programOutcomeTypeDetails">
              <p>
                </p>
            </div>

            <div class="modal__footer">
              <a class="mdl-button mdl-button--colored mdl-js-button  modal__close">
                Close
              </a>
            </div>
          </div>
        </div>
      </div>
    </div> -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
         	
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
       
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
   <jsp:include page="../elements/footer.jsp"></jsp:include>
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
     <jsp:include page="../elements/scriptResource.jsp"></jsp:include>
     
   
	
     
     
     <script type="text/javascript">
     $(document).ready(function() {
    	 $("#viewPO").click(function(){
   		  $.ajax(
   	    		  {
       	    		  url: "processViewProgramOutcomes.jsp",
       	    		  success: function(result)
       	    		  {
		    		        $("#programOutcomeTypeDetails").html(result);
   					  }
					  });
       	  });
       
     });
     /* https://www.sitepoint.com/use-jquerys-ajax-function/    */
    
     </script>
     <script type="text/javascript">

	 $(document).ready(function() {
    			 
         $('#courseListTable').DataTable({
        	 dom: 'Frtip',
        	 "paging":   true,
             "ordering": true,
             "info":     true,
             "filter": true
             });
         $('.dataTables_wrapper').find('label').each(function() {
           $(this).parent().append($(this).children());
         });
       //  $('select').addClass('mdb-select');
        // $('.mdb-select').material_select();
     });
	</script>
</body>

</html>