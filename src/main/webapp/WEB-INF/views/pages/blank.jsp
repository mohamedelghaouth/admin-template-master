<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>AdminLTE | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
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
		<h1>
			Blank page <small>it all starts here</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li><a href="#">Examples</a></li>
			<li class="active">Blank page</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		
		<div class="row">
			<div class="col-md-6">
				<div class="box">
					<div class="box-header">
						 <form action="${pageContext.request.contextPath}/edit" method="post" >
						 	<div class="">
						 				<label class="col-md-2" style="margin: 5px">Type</label>
					                    <select path="dqgd" class="col-md-3" style="margin: 5px">
							                <option value="option 1" >option 1</option>
							                <option value="option 1">option 1</option>
										</select>
										 <button type="submit" class="btn bg-olive col-md-1 " style="margin: 5px">b1</button>
										 <button type="submit" class="btn bg-olive col-md-1 " style="margin: 5px">b2</button>
							</div>
						 </form>
					</div>
				</div>
				<!-- /.box-header -->
				
					<div class="box-body nav-tabs-custom">
						
							<ul class="nav nav-tabs pull-right">
									<li ><a href="#case_List_view" data-toggle="tab">case List view</a></li>
									<li class="active"><li><a href="#Case_set_and_case" data-toggle="tab">Case set and case</a></li>
									<!-- <li class="pull-left header"><i class="fa fa-inbox"></i>Tables</li>-->
							</ul>
							<div class="tab-content no-padding">
									<div class="chart tab-pane active" id="Case_set_and_case" >
											<div >
													<div class="box box-solid">
														<div class="box-header">
															<i class="fa fa-text-width"></i>
															<h3 class="box-title">Unordered List</h3>
														</div>
														<!-- /.box-header -->
														<div class="box-body">
															<ul>
																<li>Lorem ipsum dolor sit amet</li>
																<li>Consectetur adipiscing elit</li>
																<li>Integer molestie lorem at massa</li>
																<li>Facilisis in pretium nisl aliquet</li>
																<li>Nulla volutpat aliquam velit
																	<ul>
																		<li>Phasellus iaculis neque</li>
																		<li>Purus sodales ultricies</li>
																		<li>Vestibulum laoreet porttitor sem</li>
																		<li>Ac tristique libero volutpat at</li>
																	</ul>
																</li>
																<li>Faucibus porta lacus fringilla vel</li>
																<li>Aenean sit amet erat nunc</li>
																<li>Eget porttitor lorem</li>
															</ul>
														</div>
														<!-- /.box-body -->
													</div>
											</div>
									</div>
									<div class="chart tab-pane " id="case_List_view" >										<div class="col-xs-12">
												<div class="box">
													Anim pariatur cliche reprehenderit,
										enim eiusmod high life accusamus terry richardson ad squid. 3
										wolf moon officia aute, non cupidatat skateboard dolor brunch.
										Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
										tempor, sunt aliqua put a bird on it squid single-origin
										coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
										helvetica, craft beer labore wes anderson cred nesciunt
										sapiente ea proident. Ad vegan excepteur butcher vice lomo.
										Leggings occaecat craft beer farm-to-table, raw denim
										aesthetic synth nesciunt you probably haven't heard of them
										accusamus labore sustainable VHS.
												</div>
									</div>
								<!-- /.box -->
							</div>	
			    	 
				</div>
				<!-- /.box -->
				
					<div class="box-footer">
						<button class="btn btn-info">b1</button>
						<button class="btn btn-info">b2</button>
						<button class="btn btn-info">b3</button>
						<button class="btn btn-info">b4</button>
						<button class="btn btn-info">b5</button>
					</div>
				</div>
			</div>
			<!-- /.col -->
			<div class="col-md-6">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">Bordered Table</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px">#</th>
								<th>Task</th>
								<th>Progress</th>
								<th style="width: 40px">Label</th>
							</tr>
							<tr>
								<td>1.</td>
								<td>Update software</td>
								<td>
									<div class="progress xs">
										<div class="progress-bar progress-bar-danger"
											style="width: 55%"></div>
									</div>
								</td>
								<td><span class="badge bg-red">55%</span></td>
							</tr>
							<tr>
								<td>2.</td>
								<td>Clean database</td>
								<td>
									<div class="progress xs">
										<div class="progress-bar progress-bar-yellow"
											style="width: 70%"></div>
									</div>
								</td>
								<td><span class="badge bg-yellow">70%</span></td>
							</tr>
							<tr>
								<td>3.</td>
								<td>Cron job running</td>
								<td>
									<div class="progress xs progress-striped active">
										<div class="progress-bar progress-bar-primary"
											style="width: 30%"></div>
									</div>
								</td>
								<td><span class="badge bg-light-blue">30%</span></td>
							</tr>
							<tr>
								<td>4.</td>
								<td>Fix and squish bugs</td>
								<td>
									<div class="progress xs progress-striped active">
										<div class="progress-bar progress-bar-success"
											style="width: 90%"></div>
									</div>
								</td>
								<td><span class="badge bg-green">90%</span></td>
							</tr>
						</table>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button class="btn btn-info">b1</button>
						<button class="btn btn-info">b2</button>
						<button class="btn btn-info">b3</button>
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
			</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/resources/js/AdminLTE/app.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/resources/js/AdminLTE/demo.js" type="text/javascript"></script>
    </body>
</html>