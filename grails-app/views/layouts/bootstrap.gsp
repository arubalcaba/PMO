<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<meta name="viewport" content="initial-scale = 1.0">

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="scaffolding"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">

		<r:layoutResources/>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'bootstrap-dropdown.js')}"  type="text/javascript"></script>
		<script  rel="javascript" src="${resource(dir: 'js', file: 'application.js')}"  type="text/javascript"></script>
		<g:layoutHead/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" type="text/css">
		<style type="text/css">
<!--
		img.logo {
max-height: 25px;
position: relative;
top: 4px;
}
-->
</style>
		
		

	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>	
					
					<a class="brand" href="${createLink(uri: '/')}"><img class="logo" src="${resource(dir: 'images', file: 'grails.png')}"
                     alt="logo" height="25" border="0"/> Parago PMO Dashboard <small>v1.0</small></a>

					<div class="nav-collapse">
						<ul class="nav">							
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
							<li><a href="${request.contextPath}/projectInfo/">Project Info</a></li>
						</ul>
					
					       <ul class="nav">
				                  <li class="dropdown">
				                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">Configuration <b class="caret"></b></a>
				                    <ul class="dropdown-menu">
				                      <li><a href="${request.contextPath}/auditStatus">Audit Status</a></li>
				                      <li><a href="${request.contextPath}/invoiceStatus">Invoice Status</a></li>
				                      <li><a href="${request.contextPath}/projectStatus">Project Status</a></li>
				                      <li><a href="${request.contextPath}/turnoverStatus">Turnover Status</a></li>
				                      <li class="divider"></li>
				                      <li><a href="${request.contextPath}/person">Person</a></li>
				                    </ul>
				                  </li>
				                  </ul>			
					
					
					</div>
				</div>
				
				
				
				
				
			</div>
		</nav>

		<div class="container-fluid">
			<g:layoutBody/>

			<hr>

			<footer>
				<p>&copy; Parago 2012</p>
			</footer>
		</div>	
		<!--<r:layoutResources/>-->

	</body>
</html>