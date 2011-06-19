<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--@elvariable id="events" type="java.util.List<com.jeremylund.templating.model.Event>"--%>
<!doctype html>
<html>
<head>
	<title>Templating Demos</title>
	<spring:url value="/resources" var="resourceUrl"/>
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
<body>
<div class="container">
	<div>
		<h1>Templating Demos</h1>
		<hr/>
	</div>
	<div class="span-8">
		<tiles:insertAttribute name="sidebar"/>
	</div>
	<div class="span-16 last">
		<tiles:insertAttribute name="eventList"/>
	</div>
</div>
</body>
</html>