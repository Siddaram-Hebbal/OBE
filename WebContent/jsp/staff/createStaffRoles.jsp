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
                        <h3 class="text-themecolor">Create Staff Roles</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../boards/staffBoard.jsp">Staff Dashboard</a></li>
                            <li class="breadcrumb-item active">Create Staff Role</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                         <a href="../staff/viewStaffRoles.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> View Roles</a> 
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
                    	<!-- 	private String roleCode;
								private String roleName;
								private String roleDescription; -->
                        <div class="card">
                            <div class="card-block">
                                <form class="form-horizontal form-material" action="processCreationStaffRoles.jsp" method="post">
                                	<div class="form-group">
                                        <label class="col-md-12">Role Name</label>
                                        <div class="col-md-12">
                                            <input placeholder="Role Name : Co-ordinator, sub co-ordinator" class="form-control form-control-line" type="text" id="roleName" name="roleName">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">Role Code</label>
                                        <div class="col-md-12">
                                            <input placeholder="Role Code" class="form-control form-control-line" type="text" id="roleCode" name="roleCode">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label class="col-md-12">Role Details</label>
                                        <div class="col-md-12">
                                            <input placeholder="Role Details" class="form-control form-control-line" type="text" id="roleDescription" name="roleDescription">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <!-- <button class="btn btn-success">Submit University Details</button> -->
                                            <input class="btn btn-success" type="submit" value="Submit Staff-Role Details">
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