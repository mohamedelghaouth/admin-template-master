<!DOCTYPE html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>AdminLTE | Log in</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <style>
		    .error {
		        color: red; font-weight: bold;
		    }
		</style>
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
            <div class="header"><spring:message code="lbl.page" text="Sign in" /></div>
            <form:form method="post" modelAttribute="user" action="${pageContext.request.contextPath}/login">
            <form:errors path="*" cssClass="alert alert-danger" element="div"/>
            	<c:if test="${param.error != null}">
					 <div class="alert alert-danger alert-dismissable">
						 <p>Invalid username and password.</p>
					 </div>
				</c:if>
				<c:if test="${param.logout != null}">
					 <div class="alert alert-success  alert-dismissable">
						 <p>You have been logged out successfully.</p>
					 </div>
				</c:if>
				<c:if test="${param.accessDenied !=null}">
					 <div class="alert alert-danger alert-dismissable">
						 <p>Access Denied: You are not authorised! </p>
					 </div>
				</c:if>
            	
                <div class="body bg-gray">
                    <div class="form-group">
	                    <spring:message code="lbl.USER_NAME" text="USER NAME" /><br>
	                    <form:input path="USER_NAME"  class="form-control" placeholder="USER NAME"/><br>
	                    <form:errors path="USER_NAME" cssClass="error" />
                    </div>
                    <div class="form-group">
	                    <spring:message code="lbl.USER_PASSWORD" text="USER PASSWORD" /><br>
	                    <form:input path="USER_PASSWORD"  class="form-control" placeholder="USER PASSWORD" type="password"/>
	                    <br>
	                    <form:errors path="USER_PASSWORD" cssClass="error" />
                    </div>          
                  
                </div>
                <div class="footer">                                                               
                    <button type="submit" class="btn bg-olive btn-block">
                    	<spring:message code="lbl.submit" text="Sign me in" />
                    </button>  
                    <%--<p><a href="#">I forgot my password</a></p>--%>
                    <a href="register" class="text-center">
						<spring:message code="lbl.register" text="Register a new membership" />                    
					</a>
					<br>
					<a id="en" href="home?lang=en">En</a> |   
					<a id="fr" href="home?lang=fr">Fr</a>					
                </div>
            </form:form>

        </div>


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>