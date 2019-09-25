<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../parts/cachecontrol.jsp"></jsp:include>
<html>
    <head>
        <title><sitemesh:write property='title' /></title>
		<sitemesh:write property='head' />
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="${pageContext.request.contextPath}/" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                AdminLTE
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
				<c:if test="${sessionScope.user!= null}"> 
					<div class="navbar-right"><a href="${pageContext.request.contextPath}/home" class="btn btn-info btn-sm">Sign out</a></div>
				</c:if>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
        	<c:if test="${sessionScope.user!= null}"> 
			
	            <!-- Left side column. contains the logo and sidebar -->
	            <aside class="left-side sidebar-offcanvas">
	                <!-- sidebar: style can be found in sidebar.less -->
	                <section class="sidebar">
	                    <!-- Sidebar user panel -->
	                    <div class="user-panel">
	                        <div class="pull-left image">
	                            <img src="${pageContext.request.contextPath}/resources/img/avatar3.png" class="img-circle" alt="User Image" />
	                        </div>
	                        <div class="pull-left info">
	                            <p>Hello, <c:out value='${user_decorator.USER_NAME}' /></p>
	                        </div>
	                    </div>
	                     <c:set var="user" value="${user_decorator}"/>
	                    <!-- sidebar menu: : style can be found in sidebar.less -->
	                    <ul class="sidebar-menu">
                			<li>
							 	<a href="welcome">
							 		<i class="fa fa-angle-double-right"></i> 
							 		Home
							 	</a>
							</li>
                			
                			<c:forEach items="${user.role.fonction}" var="entry">
							    <li>
								 	<a href="${pageContext.request.contextPath}/index/${entry}">
								 		<i class="fa fa-angle-double-right"></i> 
								 		${entry}
								 	</a>
								</li>
							</c:forEach>
	                    </ul>
	                </section>
	                <!-- /.sidebar -->
	            </aside>
			
			</c:if>
			
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <sitemesh:write property='body' />
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
    </body>
</html>