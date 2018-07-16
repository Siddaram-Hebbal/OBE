<%@page import="com.minds.sid.model.Course"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
		String message = (String)session.getAttribute("message");
		String step2 = (String)session.getAttribute("step2");
		Course course = (Course)session.getAttribute("course");
%>
<html>

<head>
  	
</head>

<body class="fix-header fix-sidebar card-no-border">
	<jsp:include page="../elements/headResource.jsp"></jsp:include>
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
        <jsp:include page="../elements/header.jsp"></jsp:include>
        <!-- ============================================================== -->
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
                        <h3 class="text-themecolor">Create Course</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="courseBoard">Course Board</a></li>
                            <li class="breadcrumb-item active">Create Course</li>
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
              
              <!-- Stepper -->
              		<h4 class="text-center font-bold pt-4 pb-5 mb-5"><strong>Onboard New Course</strong></h4>

			<!-- Stepper -->
			<div class="steps-form-2">
			    <div class="steps-row-2 setup-panel-2 d-flex justify-content-between">
			        <div class="steps-step-2">
			            <a href="#step-1" type="button" class="btn btn-amber btn-circle-2 waves-effect ml-0" data-toggle="tooltip" data-placement="top" title="Course Information"><i class="fa fa-folder-open-o" aria-hidden="true"></i></a>
			        </div>
			      <%if(step2 != null && step2.equalsIgnoreCase("active")){ %>
                    			  <div class="steps-step-2">
							            <a href="../associations/step2AddCourseAssociation.jsp" type="button" class="btn btn-blue-grey btn-circle-2 waves-effect" data-toggle="tooltip" data-placement="top" title="Course Details"><i class="fa fa-pencil" aria-hidden="true"></i></a>
							      </div>
							<%} 
							session.setAttribute("message", null);
							%>    
			         <!-- <div class="steps-step-2">
			            <a href="#step-2" type="button" class="btn btn-blue-grey btn-circle-2 waves-effect" data-toggle="tooltip" data-placement="top" title="Course Details"><i class="fa fa-pencil" aria-hidden="true"></i></a>
			        </div> -->
			      <!--  <div class="steps-step-2">
			            <a href="#step-3" type="button" class="btn btn-blue-grey btn-circle-2 waves-effect" data-toggle="tooltip" data-placement="top" title="Associate Course to Staff"><i class="fa fa-photo" aria-hidden="true"></i></a>
			        </div>
			        <div class="steps-step-2">
			            <a href="#step-4" type="button" class="btn btn-blue-grey btn-circle-2 waves-effect mr-0" data-toggle="tooltip" data-placement="top" title="Finish"><i class="fa fa-check" aria-hidden="true"></i></a>
			        </div> -->
			    </div>
			</div> 
			        		<%if(message != null){ %>
                    	<%-- <c:if test="${message} != null"> --%>
							<div class="card">
                            	<div class="card-block bg-success" style="color:white;">
                            	<%-- <c:out value="${sessionScope['message']}"></c:out> --%>
                            		<%=message %>
                            			 
								</div>
							</div>	  
							<%} 
							session.setAttribute("message", null);
							%>                  	
            
			<!-- First Step -->
			<form class="form-horizontal form-material" action="processCreateCourse.jsp" method="post">
			     <div class="row setup-content-2" id="step-1">
			        <div class="col-md-12">
			            <h5 class="font-weight-bold pl-0 my-4"><strong>Course Information</strong></h5>
			            <div class="form-group md-form">
			            	<label for="courseName" class="col-md-12"  data-success="right">Course Name</label>
			            	<input  id="courseName"  placeholder="course name" required="required" class="form-control form-control-line validate" type="text" name="courseName">
			            </div>
			            <div class="form-group md-form">
			                <label for="courseCode" data-error="wrong" data-success="right">Course Code</label>
			                <input  type="text" id="courseCode" name="courseCode" required="required" class="form-control validate">
			            </div>
			            <div class="form-group md-form mt-3">
			                <label for="description" data-error="wrong" data-success="right">Course Description</label>
			                <input type="text" id="description" name="description" required="required" class="form-control validate">
			            </div>
			            <button class="btn btn-mdb-color btn-rounded nextBtn-2 float-right" type="submit">Create Course</button>
			        </div>
			    </div>
			</form>
		        <!-- Row -->
                
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
           
        </div>
         <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
         	<jsp:include page="../elements/footer.jsp"></jsp:include>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
     <jsp:include page="../elements/scriptResource.jsp"></jsp:include>
     
<!--      <script type="text/javascript" src="../js/stepper.js"></script>
 -->     
     <script type="text/javascript">
    /*  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    	  e.target // newly activated tab
    	  e.relatedTarget // previous active tab
    	}) */
     </script>
</body>

</html>