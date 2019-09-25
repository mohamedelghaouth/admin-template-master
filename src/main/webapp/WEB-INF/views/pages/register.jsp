<!DOCTYPE html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>AdminLTE | Registration Page</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath}/resources/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.${pageContext.request.contextPath}/resources/js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-black">

        <div class="form-box" id="login-box">
            <div class="header"><spring:message code="lbl.register" text="register a new membership" /></div>
            <form:form action="${pageContext.request.contextPath}/register" method="post" modelAttribute="user_frm">
            	<form:errors path="*" cssClass="alert alert-danger" element="div"/>
                <div class="body bg-gray">
                    
                    <div class="form-group">
                    <spring:message code="lbl.USER_NAME" text="USER NAME" />
                    <form:input path="USER_NAME"  class="form-control" placeholder="USER NAME"/>
                    <form:errors path="USER_NAME" cssClass="error" />
                    </div>
                    <div class="form-group">
                    <spring:message code="lbl.USER_PASSWORD" text="USER PASSWORD" />
                    <form:input path="USER_PASSWORD"  class="form-control" placeholder="USER PASSWORD" type="password"/>
                    <form:errors path="USER_PASSWORD" cssClass="error" />
                    </div>
                    <div class="form-group">
                    <spring:message code="lbl.USER_PASSWORD" text="USER PASSWORD" />
                    <form:input path="confpsswd"  class="form-control" placeholder="Retype password" type="password"/>
                    <form:errors path="USER_NAME" cssClass="error" />
                    </div>
                </div>
                <div class="footer">                    

                    <button type="submit" class="btn bg-olive btn-block">Sign me up</button>

                    <a href="${pageContext.request.contextPath}/" class="text-center">I already have a membership</a>
                </div>
            </form:form>

           
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>

    </body>
</html>