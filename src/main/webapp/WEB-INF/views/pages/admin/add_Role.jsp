<!DOCTYPE  html>

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
		
	</section>

	<!-- Main content -->
	<section class="content">
		
		<div class="form-box" id="login-box">
            <div class="header"><spring:message code="lbl.register" text="register a role" /></div>
            
            <form:form action="${pageContext.request.contextPath}/edit_role" method="post" modelAttribute="role">
            	<form:errors path="*" cssClass="alert alert-danger" element="div"/>
                <div class="body bg-gray">
                	<div>
                     <form:input path="role_ID" type="hidden" name="role_ID" value="${role_ID}"/>
                    </div>
                    <div class="form-group">
	                    <div class="form-group">
		                    <spring:message code="lbl.Role_NAME" text="NAME" />
		                    <form:input path="name"  class="form-control" placeholder="Name" value="${name}"/>
		                    <form:errors path="name" cssClass="error" />
	                    </div>
	                    <div class="form-group">
		                    <c:forEach items="${functionalities}" var="entry">
							  <form:checkbox path="fonction" value="${entry}"/>${entry} 
							</c:forEach>
					   </div> 				      
                	</div>
                </div>
                <div class="footer"> 
                	
					<c:if test="${role.role_ID==null}">
						<c:set var="maVariable" value="create" scope="page" />
						<button type="submit" class="btn bg-olive btn-block"><c:out value='${pageScope.maVariable}' /></button>
                   		<a href="${pageContext.request.contextPath}/index/role" class="text-center">cancel</a> 
					</c:if>
					<c:if test="${role.role_ID!=null}">
						<c:set var="maVariable" value="update" scope="page" />
						<button type="submit" class="btn bg-olive btn-block"><c:out value='${pageScope.maVariable}' /></button>
                   		<a href="${pageContext.request.contextPath}/index/role" class="text-center">cancel</a> 
					</c:if>       
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