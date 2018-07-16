<%@page import="com.minds.sid.model.StaffRole"%>
<%@page import="com.minds.sid.model.StaffMember"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.minds.sid.database.StaffTransaction"%>
<%@page import="com.minds.sid.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
		String message = (String)session.getAttribute("message");
    StaffTransaction transaction = new StaffTransaction();	
    	List<StaffRole> staffRoles =  transaction.getStaffRoleList();  
    	Iterator<StaffRole> it = staffRoles.iterator(); 
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
                        <h3 class="text-themecolor">Staff Roles</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../boards/dashboardAdmin.jsp">Home</a></li>
                            <li class="breadcrumb-item "><a href="../boards/staffBoard.jsp">Staff Board</a></li>
                             <li class="breadcrumb-item active">View Staff Roles</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                         <a href="createStaffRoles.jsp" class="btn waves-effect waves-light btn-success pull-right hidden-sm-down"> Create Staff-Roles</a> 
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
				 <!-- Row -->
				  
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
								if(staffRoles!=null){
									%>
									<div class="card">
                            <div class="card-block">
                                <h4 class="card-title">Staff Roles</h4>
                                <!-- <h6 class="card-subtitle">Add class <code>.table</code></h6> -->
                                <div class="table-responsive" style="height: 100%;overflow-x: inherit;">
                                	<table id="roleListTable" class="table table-striped table-bordered table-responsive-md">
                                        <thead>
                                            <tr>
                                                <th>Staff-Role Code</th>
                                                <th>Role Name</th>
                                                <th>Role Details</th>
                                                <th>Created At</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
									<%
									try {
									while(it.hasNext()){
										StaffRole role = it.next();
										%>
										<tr>
                                                <td><%=role.getRoleCode() %></td> 
                                                <td><%=role.getRoleName() %></td>
                                                <td><%=role.getRoleDescription() %></td>
                                                <td><%=role.getCreatedAt() %></td>
                                                <td>
													<!-- Right aligned menu below button -->
													<button id="<%=role.getId()%>"
														class="mdl-button mdl-js-button mdl-button--icon">
														<i class="material-icons">menu</i>
													</button>

													<ul
														class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
														for="<%=role.getId()%>">
														<li class="mdl-menu__item"><a href="createRoleInfo.jsp?roleId=<%=role.getId()%>">Add Info</a></li>
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
    			 
         $('#roleListTable').DataTable({
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