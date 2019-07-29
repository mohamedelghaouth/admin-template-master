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
			<li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
	
		 <div class="form-box" id="login-box">
            <div class="header">Register New Membership<spring:message code="lbl.page" text="Sign in" /></div>
            
            <form:form action="${pageContext.request.contextPath}/edite" method="post" modelAttribute="user_frm"  >
                <div class="body bg-gray">
                     <form:input path="USER_ID" type="hidden" name="USER_ID" value="${USER_ID}"/>
                    <div class="form-group">
	                    <spring:message code="lbl.USER_NAME" text="USER NAME" />
	                    <form:input path="USER_NAME"  class="form-control" placeholder="USER NAME" value="${USER_NAME}"/>
	                    <form:errors path="USER_NAME" cssClass="error" />
                    </div>
                    <div class="form-group">
	                    <spring:message code="lbl.USER_Type" text="USER Type" />
	                    <form:input path="USER_TYPE"  class="form-control" placeholder="USER Type" value="${USER_TYPE}"/>
	                    <form:errors path="USER_TYPE" cssClass="error" />
                    </div>
                    <div class="form-group">
	                    <spring:message code="lbl.USER_PASSWORD" text="USER PASSWORD" />
	                    <form:input path="USER_PASSWORD"  class="form-control" placeholder="USER PASSWORD" type="password" />
	                    <form:errors path="USER_PASSWORD" cssClass="error" />
                    </div>
                    <div class="form-group">
	                    <spring:message code="lbl.USER_PASSWORD" text="USER PASSWORD" />
	                    <form:input path="confpsswd"  class="form-control" placeholder="Retype password" type="password"/>
	                    <form:errors path="USER_NAME" cssClass="error" />
                    </div>
                </div>
                <div class="footer">                    

                    <button type="submit" class="btn bg-olive btn-block">update</button>

                    <a href="index" class="text-center">cancel</a>
                </div>
            </form:form>

           
        </div>
	
	
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