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
		
	</section>

	<!-- Main content -->
	<section class="content">
	
		 <div class="" >
            <div class="header"><h1><spring:message code="lbl.register" text="register a new membership" /></h1></div>
            
            <form:form action="${pageContext.request.contextPath}/edit" method="post" modelAttribute="user_frm">
            	<form:errors path="*" cssClass="alert alert-danger" element="div"/>
                <div class="row">
                	<div>
                     <form:input path="USER_ID" type="hidden" name="USER_ID" value="${USER_ID}"/>
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.USER_NAME" text="USER NAME" />
	                    <form:input path="USER_NAME"  class="form-control" placeholder="USER NAME" value="${USER_NAME}"/>
	                    <form:errors path="USER_NAME" cssClass="error" />
                    </div>
                    
                    <div class="form-group col-xs-4">
	                    <spring:message code="role" text="Role" />
	                    <form:select  path="Role.role_ID" class="form-control">
						  <c:forEach items="${roles}" var="role">
						  	<c:choose>
						            <c:when test="${role.role_ID eq Role.role_ID}">
						                <form:option value="${role.role_ID}" selected="true">${role.name}</form:option>
						            </c:when>
						            <c:otherwise>
						                <form:option value="${role.role_ID}">${role.name}</form:option>
						            </c:otherwise>
						    </c:choose> 
						  </c:forEach>
						</form:select>
	                    <form:errors path="USER_TYPE" cssClass="error" />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.USER_Type" text="USER Type" />
	                    <form:input path="USER_TYPE"  class="form-control" placeholder="USER Type" value="${USER_TYPE}"/>
	                    <form:errors path="USER_TYPE" cssClass="error" />
                    </div>
                    <c:if test="${user_frm.USER_ID==null}">
							<div class="form-group col-xs-4 ">
			                    <spring:message code="lbl.USER_PASSWORD" text="USER PASSWORD" />
			                    <form:input path="USER_PASSWORD"  class="form-control" placeholder="USER PASSWORD" type="password" value="${USER_PASSWORD}" />
			                    <form:errors path="USER_PASSWORD" cssClass="error"  />
	                   		 </div>
		                    <div class="form-group col-xs-4">
			                    <spring:message code="lbl.confpsswd" text="confirm password" />
			                    <form:input path="confpsswd"  class="form-control" placeholder="Retype password" type="password" value="${confpsswd}"/>
			                    <form:errors path="confpsswd" cssClass="error" />
		                    </div>
					</c:if>
					<c:if test="${user_frm.USER_ID!=null}">
						<div class="form-group ">
		                    <form:input path="USER_PASSWORD" type="hidden"  class="form-control" placeholder="USER PASSWORD"  value="${USER_PASSWORD}" />	                    
                    	</div>
	                    <div class="form-group ">
		                    <form:input path="confpsswd" type="hidden" class="form-control" placeholder="Retype password" value="${confpsswd}"/>               
	                    </div>
					</c:if>
                    
                    <div class="form-group col-xs-4 ">
	                    <spring:message code="lbl.USER_BANK_CODE" text="USER BANK CODE" />
	                    <form:input path="USER_BANK_CODE"  class="form-control" placeholder="USER_BANK_CODE"  value="${USER_BANK_CODE}"/>
	                    <form:errors path="USER_BANK_CODE" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.USER_BRANCH_CODE" text="USER BRANCH CODE" />
	                    <form:input path="USER_BRANCH_CODE"  class="form-control" placeholder="USER_BRANCH_CODE"  value="${USER_BRANCH_CODE}"/>
	                    <form:errors path="USER_BRANCH_CODE" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.NUMBER_OF_TRIES_ALLOWED" text="NUMBER OF TRIES ALLOWED" />
	                    <form:input path="NUMBER_OF_TRIES_ALLOWED"  class="form-control" placeholder="NUMBER_OF_TRIES_ALLOWED" value="${NUMBER_OF_TRIES_ALLOWED}" />
	                    <form:errors path="NUMBER_OF_TRIES_ALLOWED" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.IP_ADDRESS_MANG" text="IP ADDRESS MANG" />
	                    <form:input path="IP_ADDRESS_MANG"  class="form-control" placeholder="IP_ADDRESS_MANG" value="${IP_ADDRESS_MANG}"/>
	                    <form:errors path="IP_ADDRESS_MANG" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.IP_ADDRESS" text="IP ADDRESS" />
	                    <form:input path="IP_ADDRESS"  class="form-control" placeholder="IP ADDRESS" value="${IP_ADDRESS}"/>
	                    <form:errors path="IP_ADDRESS" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.FIRST_CONNECTION" text="FIRST CONNECTION" />
	                    <form:input path="FIRST_CONNECTION"  class="form-control" placeholder="FIRST_CONNECTION" value="${FIRST_CONNECTION}"/>
	                    <form:errors path="FIRST_CONNECTION" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.NBRE_SESSION_ALLOWED" text="NUNBRE SESSION ALLOWED" />
	                    <form:input path="NBRE_SESSION_ALLOWED"  class="form-control" placeholder="NBRE_SESSION_ALLOWED" value="${NBRE_SESSION_ALLOWED}"/>
	                    <form:errors path="NBRE_SESSION_ALLOWED" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.COMPLEXITY_FLAG" text="COMPLEXITY FLAG" />
	                    <form:input path="COMPLEXITY_FLAG"  class="form-control" placeholder="COMPLEXITY_FLAG" value="${COMPLEXITY_FLAG}"/>
	                    <form:errors path="COMPLEXITY_FLAG" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.EXPIRATION_PASSWORD" text="EXPIRATION PASSWORD" />
	                    <form:input path="EXPIRATION_PASSWORD"  class="form-control" placeholder="EXPIRATION_PASSWORD" value="${EXPIRATION_PASSWORD}"/>
	                    <form:errors path="EXPIRATION_PASSWORD" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.DATE_START_PASS" text="DATE START PASS" />
	                    <form:input path="DATE_START_PASS"  class="form-control" placeholder="UDATE_START_PASS" value="${DATE_START_PASS}"/>
	                    <form:errors path="DATE_START_PASS" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.DATE_END_PASS" text="DATE END PASS" />
	                    <form:input path="DATE_END_PASS"  class="form-control" placeholder="DATE_END_PASS" value="${DATE_END_PASS}"/>
	                    <form:errors path="DATE_END_PASS" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.BLOCK_ACCESS" text="BLOCK ACCESS" />
	                    <form:input path="BLOCK_ACCESS"  class="form-control" placeholder="BLOCK_ACCESS" value="${BLOCK_ACCESS}"/>
	                    <form:errors path="BLOCK_ACCESS" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.LANGUAGE_CODE" text="LANGUAGE CODE" />
	                    <form:input path="LANGUAGE_CODE"  class="form-control" placeholder="LANGUAGE_CODE" value="${LANGUAGE_CODE}"/>
	                    <form:errors path="LANGUAGE_CODE" cssClass="error"  />
                    </div>
                    <div class="form-group col-xs-4">
	                    <spring:message code="lbl.LAST_4_PWD" text="LAST 4 PWD" />
	                    <form:input path="LAST_4_PWD"  class="form-control" placeholder="LAST_4_PWD" value="${LAST_4_PWD}"/>
	                    <form:errors path="LAST_4_PWD" cssClass="error"  />
                    </div>
                </div>
                <div class="footer" style="display:flex; justify-content: center ">                    
					
					<c:if test="${user_frm.USER_ID==null}">
						<c:set var="maVariable" value="create" scope="page" /> 
						<div class="col-xs-4" style="float: center; ">
						 <button type="submit" class="btn bg-olive btn-block "><c:out value='${pageScope.maVariable}' /></button>
						 <a href="${pageContext.request.contextPath}/index/user" class="text-center">cancel</a>
						</div>
					</c:if>
					<c:if test="${user_frm.USER_ID!=null}">
						<c:set var="maVariable" value="update" scope="page" />
						<div class="row col-xs-4" >
						 <button type="submit" class="btn bg-olive btn-block "><c:out value='${pageScope.maVariable}' /></button>
						 <a href="${pageContext.request.contextPath}/index/user" class="text-center">cancel</a>
						 </div>
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