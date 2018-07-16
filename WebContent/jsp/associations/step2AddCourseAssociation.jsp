<%@page import="com.minds.sid.model.StaffRole"%>
<%@page import="com.minds.sid.model.StaffMember"%>
<%@page import="com.minds.sid.database.StaffTransaction"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
		String message = (String)session.getAttribute("message");
		String step2 = (String)session.getAttribute("step2");
	//	Course course = (Course)session.getAttribute("course");
		
		CourseTransaction transaction = new CourseTransaction();	
		List<Course> courses =  transaction.getCoursesList();  
    	Iterator<Course> it = courses.iterator(); 
    	
    	StaffTransaction staffTransaction = new StaffTransaction();	
		List<StaffMember> staffMembers =  staffTransaction.getStaffList();  
    	Iterator<StaffMember> itStaff = staffMembers.iterator();
    	List<StaffMember> reportingStaffMembers = staffMembers;
    	Iterator<StaffMember> itReportingStaff =  reportingStaffMembers.iterator();
    	
    	List<StaffRole> staffRoles = staffTransaction.getStaffRoleList();
    	Iterator<StaffRole> itStaffRole = staffRoles.iterator();
%>
<html>

<head>
	<link  href="../../mdl/select/getmdl-select.min.css" rel="stylesheet">  	
		<link  href="../../assets/jqueryUI/css/jquery-ui.css" rel="stylesheet">
		<link  href="../../assets/jqueryUI/css/style.css" rel="stylesheet">  	
	
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
                        <h3 class="text-themecolor">Allocate Course to Staff</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../boards/courseBoard.jsp">Course Board</a></li>
                            <li class="breadcrumb-item active">Associate Course to Staff</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                         <a href="viewStaffCourseAssociation.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> View Allocations</a> 
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
           <form class=" " action="processAddCourseAssociation.jsp" method="post">

			
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
			
			    <div class="row setup-content-2" id="step-2">
			        <div class="col-md-12">
			            <h4 class="font-weight-bold pl-0 my-4"><strong>Course Details</strong></h4>
			            <div class="form-group md-form">
						    <div class="mdl-textfield mdl-js-textfield getmdl-select getmdl-select__fix-height">
						        <input type="text" value="" class="mdl-textfield__input" id="courseIdSelected" readonly>
						        <input type="hidden" value="" name="courseIdSelected">
						        <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
						        <label for="courseIdSelected" class="mdl-textfield__label">Course</label>
						         <%
								if(courses!=null){
									%>
						        <ul for="courseIdSelected" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Course</li>
						        <%
									try {
									while(it.hasNext()){
										Course course2 = it.next();
										%>
									<li class="mdl-menu__item" data-val="<%=course2.getId()%>"><%=course2.getName() %></li>	
										<%
									}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
						          
						        </ul>
						         <%}else{ %>
						    	<ul for="courseIdSelected" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Course</li>
						          </ul>
						    <%} %>
						    </div>
						   
			            </div>
			            
			            <div class="form-group md-form">
			               <!-- mdl-textfield--floating-label -->
						    <div class="mdl-textfield mdl-js-textfield  getmdl-select getmdl-select__fix-height">
						        <input type="text" value="" class="mdl-textfield__input" id="staffIdSelected" readonly>
						        <input type="hidden" value="" name="staffIdSelected">
						        <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
						        <label for="staffIdSelected" class="mdl-textfield__label">Staff</label>
						         <%
								if(staffMembers!=null){
									%>
						        <ul for="staffIdSelected" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Staff</li>
						        <%
									try {
									while(itStaff.hasNext()){
										StaffMember member2 = itStaff.next();
										%>
									<li class="mdl-menu__item" data-val="<%=member2.getId()%>"><%=member2.getFirstname() %> - id: <%=member2.getStaffCode() %></li>	
										<%
									}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
						        
						        </ul>
						         <%}else{ %>
						    	<ul for="staffIdSelected" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Staff</li>
						          </ul>
						    <%} %>
						    </div>
						   
			            </div>
			            
			            
			            <div class="form-group md-form">
			                <!-- Pre-selected value -->
						    <!-- Pre-selected value -->
						   
						    <div class="mdl-textfield mdl-js-textfield  getmdl-select getmdl-select__fix-height">
						        <input type="text" value="" class="mdl-textfield__input" id="reportsToStaffId" readonly>
						        <input type="hidden" value="" name="reportsToStaffId">
						        <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
						        <label for="reportsToStaffId" class="mdl-textfield__label">Reports to Staff</label>
						         <%
								if(staffMembers!=null){
									%>
						        <ul for="reportsToStaffId" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Reports to Staff</li>
						        <%
									try {
										System.out.println("length of staffMembers  - "+itReportingStaff.hasNext());
									while(itReportingStaff.hasNext()){
										StaffMember reportingStaff = itReportingStaff.next();
										%>
									<li class="mdl-menu__item" data-val="<%=reportingStaff.getId()%>"><%=reportingStaff.getFirstname() %> - id: <%=reportingStaff.getStaffCode() %></li>	
										<%
									}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
						         
						        </ul>
						         <%}else{ %>
						    	<ul for="reportsToStaffId" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Reports to Staff 1111</li>
						          </ul>
						    <%} %>
						    </div>
						   
			            </div>
			      <!-- STAFF ROLE   itStaffRole -->      
			            <div class="form-group md-form">
			                <!-- Pre-selected value -->
						    <!-- Pre-selected value -->
						   
						    <div class="mdl-textfield mdl-js-textfield  getmdl-select getmdl-select__fix-height">
						        <input type="text" value="" class="mdl-textfield__input" id="staffRoleId" readonly>
						        <input type="hidden" value="" name="staffRoleId">
						        <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
						        <label for="staffRoleId" class="mdl-textfield__label">Staff Role</label>
						         <%
								if(staffRoles!=null){
									%>
						        <ul for="staffRoleId" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Staff Role </li>
						        <%
									try {
									while(itStaffRole.hasNext()){
										StaffRole staffRole2 = itStaffRole.next();
										%>
									<li class="mdl-menu__item" data-val="<%=staffRole2.getId()%>"><%=staffRole2.getRoleName() %> - Code: <%=staffRole2.getRoleCode() %></li>	
										<%
									}
									}catch(Exception e){
										e.printStackTrace();
									}
									%>
						         
						        </ul>
						         <%}else{ %>
						    	<ul for="staffRoleId" class="mdl-menu mdl-menu--bottom-left mdl-js-menu">
						          <li class="mdl-menu__item" data-val="select" data-selected="true">Select Reports to Staff</li>
						          </ul>
						    <%} %>
						    </div>
						   
			            </div>
			           
			            <div class="form-group md-form">
			            	<!--Grid row-->
							<p>Date: <input type="text" id="fromDate"  name="dateFrom"></p>
							<!--Grid row-->
			            </div>
			            <div class="form-group md-form">
			            	<!--Grid row-->
							<p>Date: <input type="text" id="toDate" name="dateTo"></p>
							<!--Grid row-->
			            </div>
			            
			            <div class="form-group md-form mt-3">
			                <label for="orgUnitId" data-error="wrong" data-success="right">Organisation Unit</label>
			                <input id="orgUnitId" type="text" required="required" name="orgUnitId" class="form-control validate" value="0">
			            </div>
			            
			            <div class="form-group md-form mt-3">
			                <label for="otherDetails" data-error="wrong" data-success="right">Other Details</label>
			                <input id="otherDetails" type="text" required="required" class="form-control validate" value="">
			            </div>
			            <input class="btn btn-mdb-color btn-rounded prevBtn-2 float-left" type="submit" value="Allocate"/>
			           <!--  <button class="btn btn-mdb-color btn-rounded nextBtn-2 float-right" type="button">Next</button> -->
			        </div>
			    </div>
			
               <!-- Row -->
                
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->
        </form>
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
      <script type="text/javascript" src="../../assets/jqueryUI/js/jquery-ui.js"></script>
<!--      <script type="text/javascript" src="../js/stepper.js"></script>
 -->     <script type="text/javascript" src="../js/to_and_from.js"></script>
 <script type="text/javascript" src="../../mdl/select/getmdl-select.min.js"></script>
     
    <script>
  $( function() {
    $( "#fromDate" ).datepicker({ minDate: -20, maxDate: "+1M +10D" });
    $( "#toDate" ).datepicker({ minDate: -20, maxDate: "+1M +10D" });
  } );
  </script>
</body>

</html>