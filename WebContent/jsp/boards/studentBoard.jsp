<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
		String message = (String)session.getAttribute("message");
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
                        <h3 class="text-themecolor">Create Student</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../boards/studentBoard.jsp">Student Dashboard</a></li>
                            <li class="breadcrumb-item active">Create Student Profile</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                         <a href="../student/viewStudent.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> View Student</a> 
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
                    <div class="col-12">
                    		<%if(message != null){ %>
                    	<%-- <c:if test="${message} != null"> --%>
							<div class="card">
                            	<div class="card-block bg-info" style="color:white;">
                            		<%=message %>
								</div>
							</div>	  
							<%} 
							session.setAttribute("message", null);
							%>                  	
                    	<%-- </c:if> --%>
                    	
                        <div class="card">
                            <div class="card-block">
                                <form class="form-horizontal form-material" action="processCreateStudent.jsp" method="post">
                                	<div class="form-group">
                                        <label class="col-md-12">Student Admission Number</label>
                                        <div class="col-md-12">
                                            <input placeholder="Student Adm Number" class="form-control form-control-line" type="text" id="studentAdmNo" name="studentAdmNo">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">First Name</label>
                                        <div class="col-md-12">
                                            <input placeholder="first name" class="form-control form-control-line" type="text" id="firstName" name="firstName">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-md-12">Middle Name</label>
                                        <div class="col-md-12">
                                            <input placeholder="Middle name" class="form-control form-control-line" type="text" id="middleName" name="middleName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Last Name</label>
                                        <div class="col-md-12">
                                            <input placeholder="last name" class="form-control form-control-line" type="text" id="lastName" name="lastName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Gender</label>
                                        <div class="col-md-12">
                                        	<!-- Radio Button 1 -->
											 <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="gender_male">
											  <input type="radio" id="gender_male" class="mdl-radio__button" name="gender" checked />
											                              <!-- intitial state checked using attribute checked  -->
											  <span class="mdl-radio__label">Male</span>
											</label>
											   
											  <br>
											  <br>
											 
											 <!-- Radio Button 2 -->
											<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="gender_female">
											  <input type="radio" id="gender_female" class="mdl-radio__button" name="gender" />
											  <span class="mdl-radio__label">Female</span>
											</label>
                                        </div>
                                    </div>
									<div class="form-group">
                                        <label class="col-md-12">Date of Birth</label>
                                        <div class="col-md-12">
                                            <input placeholder="dob" class="form-control form-control-line" type="text" id="dob" name="dob">
                                        </div>
                                    </div>
									
                                     <div class="form-group">
                                        <label class="col-md-12" for="password">Password</label>
                                        <div class="col-md-12">
                                            <input value="" class="form-control form-control-line" type="password" id="password" name="password">
                                        </div>
                                    </div>
                                     
                                                         
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">Email</label>
                                        <div class="col-md-12">
                                            <input placeholder="johnathan@admin.com" class="form-control form-control-line" name="email" id="email" type="email">
                                        </div>
                                    </div>
                                   
                                    <!-- 
                    	private String firstname;
	private String middlename;
	private String lastname;
	private String dob;
	private String gender;
	private String password;
	private String email;
	private String staffCode;
	private String phoneNo;
	private String message;
	private String address;
	private String otherDetails;
                    	 -->
                                    <div class="form-group">
                                        <label class="col-md-12">Phone No</label>
                                        <div class="col-md-12">
                                            <input placeholder="123 456 7890" class="form-control form-control-line" type="text" id="phoneNo" name="phoneNo">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Message</label>
                                        <div class="col-md-12">
                                            <textarea rows="5" class="form-control form-control-line" name="message"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Address</label>
                                        <div class="col-md-12">
                                            <textarea rows="5" class="form-control form-control-line" name="address"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Other Details</label>
                                        <div class="col-md-12">
                                            <textarea rows="5" class="form-control form-control-line" name="otherDetails"></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <!-- <button class="btn btn-success">Submit University Details</button> -->
                                            <input class="btn btn-success" type="submit" value="Submit Student Details">
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
</body>

</html>