<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
    <head>
        <title>AdminLTE | Dashboard</title>
         <!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="${pageContext.request.contextPath}/resources/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="${pageContext.request.contextPath}/resources/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <link href="${pageContext.request.contextPath}/resources/css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
        <!-- Daterange picker -->
        <link href="${pageContext.request.contextPath}/resources/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.${pageContext.request.contextPath}/resources/js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
                     <!-- Content Header (Page header) -->
			<section class="content-header">
				
				
			</section>
			
			<section class="content">
				<div class="row">
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs pull-right">
							<c:if test="${ not empty user_table}">
								<li class="active"><li><a href="#users" data-toggle="tab">users</a></li>
							</c:if>
							<c:if test="${ not empty role_table}">
								<li class="active"><a href="#categories" data-toggle="tab">Roles</a></li>
							</c:if>
							<li class="pull-left header"><i class="fa fa-inbox"></i>Tables</li>
						</ul>
						<div class="tab-content no-padding">
							<c:if test="${ not empty user_table}">
								<div class="chart tab-pane active" id="users" style="position: relative; height: 300px;">
									<div class="col-xs-12">
									<div class="box">
										<div class="box-header">
											<h3 class="box-title">users Table</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body table-responsive no-padding">
											<table class="table table-hover">
												<tr>
													<th>ID</th>
													<th>User</th>
													<th>Type</th>	
													<th>Action</th>	
												</tr>
												
												<c:forEach items="${userlist}" var="user">  
													<tr>
														<td> <c:out value="${user.USER_ID}"/></td>
														<td> <c:out value="${user.USER_NAME}"/></td>
														<td> <c:out value="${user.USER_TYPE}"/></td>
														<td>
																<a href="${pageContext.request.contextPath}/edit?user_ID=${user.USER_ID}" class="btn btn btn-warning btn-xs" >edite</a>
																<a href="${pageContext.request.contextPath}/delete?user_ID=${user.USER_ID}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure you want to delete this item');" >Delete</a>
														</td>
													</tr>   
												</c:forEach>
											
											</table>
										</div>
										
										<!-- /.box-body -->
									</div>
									<div class="box-footer clearfix no-border">
										<a href="${pageContext.request.contextPath}/edit" class="btn  btn-success btn-sm pull-righ">add user</a>										
									</div>
									</div>
								</div>	
							</c:if>
							<c:if test="${ not empty role_table}">
									<div class="chart tab-pane active" id="categories" style="position: relative; height: 300px;">										<div class="col-xs-12">
												<div class="box">
														<div class="box-header">
															<h3 class="box-title">Roles Table</h3>
														</div>
														<!-- /.box-header -->
														<div class="box-body table-responsive no-padding">
															<table class="table table-hover">
																<tr>
																	<th>ID</th>
																	<th>Name</th>
																	<th>Action</th>
																</tr>
																<c:forEach items="${rolelist}" var="role">  
																	<tr>
																		<td> <c:out value="${role.role_ID}"/></td>
																		<td> <c:out value="${role.name}"/></td>
																		<td>
																			<a href="${pageContext.request.contextPath}/edit_role?role_ID=${role.role_ID}" class="btn btn btn-warning btn-xs" >edite</a> 										
																			<a href="${pageContext.request.contextPath}/delete_role?role_ID=${role.role_ID}" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure you want to delete this item');" >Delete</a> 										
																		</td>
																	</tr>   
																</c:forEach>
															</table>
														</div>
															<!-- /.box-body -->
												</div>
												<div class="box-footer clearfix no-border">
													<a href="${pageContext.request.contextPath}/edit_role" class="btn  btn-success btn-sm pull-righ">add role</a>									
												</div>	
									    </div>	
								   	</div>	

							</c:if>	
							<!-- /.box -->
						</div>	
			    </div>
			    </div>
		    </section>	
			
			
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Morris.js charts -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris.min.js" type="text/javascript"></script>
        <!-- Sparkline -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <!-- jvectormap -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <!-- fullCalendar -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
        <!-- jQuery Knob Chart -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        <!-- iCheck -->
        <script src="${pageContext.request.contextPath}/resources/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/resources/js/AdminLTE/app.js" type="text/javascript"></script>
        
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="${pageContext.request.contextPath}/resources/js/AdminLTE/dashboard.js" type="text/javascript"></script>     
        
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/resources/js/AdminLTE/demo.js" type="text/javascript"></script>
	
    </body>
</html>