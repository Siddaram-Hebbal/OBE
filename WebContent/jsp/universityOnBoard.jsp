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
                            <li class="breadcrumb-item"><a href="dashboardAdmin.jsp">University Creation</a></li>
                            <li class="breadcrumb-item active">Create University</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                        <!-- <a href="createUniversity.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> Create University</a> -->
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
                            	<div class="card-block bg-warning" style="color:white;">
                            	<%-- <c:out value="${sessionScope['message']}"></c:out> --%>
                            		<%=message %>	 
								</div>
							</div>	  
							<%} %>                  	
                    	<%-- </c:if> --%>
                        <div class="card">
                            <div class="card-block">
                                <form class="form-horizontal form-material" action="processUniversityOnBoard.jsp" method="post">
                                    <div class="form-group">
                                        <label class="col-md-12">University</label>
                                        <div class="col-md-12">
                                            <input placeholder="university name" class="form-control form-control-line" type="text" id="name" name="name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">University Registration Code</label>
                                        <div class="col-md-12">
                                            <input placeholder="university code" class="form-control form-control-line" type="text" id="registrationCode" name="registrationCode">
                                        </div>
                                    </div>
                                   	<div class="form-group">
                                        <label class="col-md-12">Contact</label>
                                        <div class="col-md-12">
                                            <input placeholder="contact" class="form-control form-control-line" type="text" id="contact" name="contact">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-md-12">Email</label>
                                        <div class="col-md-12">
                                            <input placeholder="contact@university.com" class="form-control form-control-line"  id="email" name="email" type="email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">University Website</label>
                                        <div class="col-md-12">
                                            <input placeholder="hhtp://www.mit.com" class="form-control form-control-line" type="text" id="website" name="website">
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <label class="col-md-12">University Address</label>
                                        <div class="col-md-12">
                                            <textarea rows="3" class="form-control form-control-line" id="address" name="address"></textarea>
                                        </div>
                                    </div>
                                    
                                   <!--  <div class="form-group">
                                        <label class="col-md-12">Phone No</label>
                                        <div class="col-md-12">
                                            <input placeholder="123 456 7890" class="form-control form-control-line" type="text">
                                        </div>
                                    </div> -->
                                    <div class="form-group">
                                        <label class="col-md-12">Description</label>
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
                                            <input type="submit" value="Submit University Details">
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
            <!-- footer -->
            <!-- ============================================================== -->
         	<jsp:include page="footer.jsp"></jsp:include>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
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
     <jsp:include page="scriptResource.jsp"></jsp:include>
</body>

</html>