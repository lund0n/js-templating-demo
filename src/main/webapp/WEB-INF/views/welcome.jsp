<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html>
<head>
	<title>Templating Demos</title>
	<spring:url value="/resources" var="resourceUrl"/>
	<link type="text/css" rel="stylesheet" href="${resourceUrl}/dijit/themes/tundra/tundra.css"/>
	<link rel="stylesheet" href="${resourceUrl}/styles/blueprint/screen.css" type="text/css"
		  media="screen, projection"/>
	<link rel="stylesheet" href="${resourceUrl}/styles/blueprint/print.css" type="text/css" media="print"/>
	<!--[if lt IE 8]>
				 <link rel="stylesheet" href="${resourceUrl}/blueprint/ie.css" type="text/css" media="screen, projection" />
		 <![endif]-->
	<script type="text/javascript" src="${resourceUrl}/dojo/dojo.js"></script>
	<script type="text/javascript" src="${resourceUrl}/spring/Spring.js"></script>
	<script type="text/javascript" src="${resourceUrl}/spring/Spring-Dojo.js"></script>
</head>
<body class="tundra">
<div class="container">
	<div>
		<h1>Templating Demos</h1>
		<hr/>
	</div>
	<div>
		<ul>
			<li>
				<spring:url value="/example1" var="example1Url"/>
				<a href="${example1Url}">Example 1</a>
			</li>
			<li>
				<spring:url value="/events" var="eventsUrl"/>
				<a href="${eventsUrl}">Events</a>
			</li>
			<li>
				<spring:url value="/events/list" var="eventsListUrl"/>
				<a href="${eventsListUrl}">Events</a> (using jQuery templates)
			</li>
		</ul>
	</div>
</div>
</body>
</html>