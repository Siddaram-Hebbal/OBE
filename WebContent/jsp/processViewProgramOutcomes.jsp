<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.minds.sid.model.ProgramOutcomeType"%>
<%@page import="com.minds.sid.database.CourseTransaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	CourseTransaction transaction = new CourseTransaction();
    	List<ProgramOutcomeType> programOutcomeTypes = transaction.getProgramOutcomeTypes(); 
    	
    	Iterator<ProgramOutcomeType> it = programOutcomeTypes.iterator();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 	<link rel="stylesheet" type="text/css" href="../mdb/datatable/dataTables.bootstrap4.min.css"/>
	<link rel="stylesheet" type="text/css" href="../mdb/datatable/datatable.css"/> -->
</head>
<body>
	
	<%
								if(programOutcomeTypes!=null){
									%>
								
                               <!--  <h4 class="card-title">Program Outcome Types</h4> -->
                                <!-- <h6 class="card-subtitle">Add class <code>.table</code></h6> -->
                               
                                <table id="example" class="table table-striped table-bordered table-responsive-md" cellspacing="0" width="100%">
								    <thead>
								        <tr>
                                                <th class="">PO Code</th>
                                                <th class="">PO Name</th>
                                                <th >Created At</th>
                                                <th class="">PO Description</th>
                                               <!--  <th>Actions</th> -->
                                            </tr>
                                        </thead>
                                        <tbody>
									<%
									try {
									while(it.hasNext()){
										ProgramOutcomeType programOutcomeType = it.next();
										%>
										<tr>
                                                <td  class="mdl-data-table__cell--non-numeric"><%=programOutcomeType.getPoCode() %></td>
                                                <td  class="mdl-data-table__cell--non-numeric"><%=programOutcomeType.getName() %></td>
                                                <td  ><%=programOutcomeType.getCreatedAt() %></td>
                                                <td  class="mdl-data-table__cell--non-numeric"><%=programOutcomeType.getDescription() %></td>
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
									
<!-- https://mdbootstrap.com/content/tables/ -->
<!-- <script src="../mdb/datatable/jquery.dataTables.min.js"></script>
	<script src="../mdb/datatable/dataTables.bootstrap4.min.js"></script>	 -->
	<script type="text/javascript">

	 $(document).ready(function() {
    			 
         $('#example').DataTable({
        	 dom: 'Flrtip',
        	 "paging":   true,
             "ordering": true,
             "info":     true
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