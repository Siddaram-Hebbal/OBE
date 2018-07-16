<%@page import="java.util.Iterator"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
		String message = (String)session.getAttribute("message");
     
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                        <h3 class="text-themecolor">Staff Board</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="dashboardAdmin.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Staff Board</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                         <a href="../staff/createStaff.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> Create Staff</a> 
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
								  <div class="mdl-cell mdl-cell--9-col"> -->
								    <h4 class="text-white card-title">Staff : 7</h4>
									<h6 class="card-subtitle text-white m-b-0 op-5">Staff strength</h6>
								<!--   </div>
								</div>	 -->
								
							</div>
							<div class="card-block">
								<div class="message-box contact-box">
									<h2 class="add-ct-btn">
										<!-- <button type="button"
											class="btn btn-circle btn-lg btn-success waves-effect waves-dark">+</button> -->
									</h2>
									<div class="message-widget contact-widget">
										
										<!-- Message -->
										<a href="../staff/createStaff.jsp">
											<div class="user-img">
											
											</div>
											<div class="">
												<span class="">Create Staff</span>
												
											</div>
										</a>
											<!-- Message -->
										<a href="../staff/viewStaff.jsp">
											<div class="user-img">
												
											</div>
											<div class="">
												
												<span id="viewPO" data-toggle="modal" data-target="#exampleModal">View Staff</span>
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
										<a href="../associations/associateStaffCourse.jsp">
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
					<div class="col-4">
						<div class="card">
							<div class="card-block bg-info">
								<!-- <div class="content-grid mdl-grid">
						      		<div class="mdl-cell "> -->
										<h4 class="text-white card-title">Staff-Roles : 3</h4>
										<h6 class="card-subtitle text-white m-b-0 op-5">Staff-Course Summary</h6>
									<!-- </div>
								</div> -->
							</div>
							<div class="card-block">
								<div class="message-box contact-box">
									<h2 class="add-ct-btn">
										
									</h2>
									<div class="message-widget contact-widget">
										<a href="../staff/createStaffRoles.jsp">
											<div class="user-img">
											</div>
											<div class="">
												<span class="">Create Staff Roles</span>
											</div>
										</a>	
										<a href="../staff/viewStaffRoles.jsp">
											<div class="user-img">
											</div>
											<div class="">
												<span class="">View Staff Roles</span>
											</div>
										</a>	
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                        
				<!-- Row -->
				
				<!-- --------------------------BSVRAJ--------------------------------------- -->
				
				<div class="row">
					<div class="col-4">
						<div class="card">
							<div class="card-block bg-info">
								<!-- <div class="content-grid mdl-grid">
								  <div class="mdl-cell mdl-cell--9-col"> -->
								    <h4 class="text-white card-title">Add Student</h4>
									<h6 class="card-subtitle text-white m-b-0 op-5">Student strength</h6>
								<!--   </div>
								</div>	 -->
								
							</div>
							<div class="card-block">
								<div class="message-box contact-box">
									<h2 class="add-ct-btn">
										<!-- <button type="button"
											class="btn btn-circle btn-lg btn-success waves-effect waves-dark">+</button> -->
									</h2>
									<div class="message-widget contact-widget">
										
										<!-- Message -->
										<a href="../student/createStudent.jsp">
											<div class="user-img">
											
											</div>
											<div class="">
												<span class="">Create Student</span>
												
											</div>
										</a>
											<!-- Message -->
										<a href="../student/viewStudent.jsp">
											<div class="user-img">
												
											</div>
											<div class="">
												
												<span id="viewPO" data-toggle="modal" data-target="#exampleModal">View Student</span>
												<!-- <span class="mail-desc">View Program Outcome Type</span> -->
											</div>
										</a>

									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
                
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
             </div>
     
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
   
</body>

</html>