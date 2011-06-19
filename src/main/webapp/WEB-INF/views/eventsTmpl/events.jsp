<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--@elvariable id="events" type="java.util.List<com.jeremylund.templating.model.Event>"--%>
<%--@elvariable id="years" type="java.util.List<java.lang.Integer>"--%>
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
	<script type="text/javascript" src="${resourceUrl}/scripts/jquery-1.5.min.js"></script>
	<script type="text/javascript" src="${resourceUrl}/scripts/jquery.tmpl.min.js"></script>
</head>
<body>
<div class="container">
	<div>
		<h1>Templating Demos</h1>
		<hr/>
	</div>
	<div class="span-8">
		<form:form modelAttribute="eventFilterForm">
			<fieldset>
				<legend>Filter By</legend>
				<p>
					<form:label path="year">Year</form:label><br/>
					<form:select path="year">
						<form:option value="2010"/>
						<form:option value="2011"/>
						<form:option value="2012"/>
					</form:select>
				</p>
			</fieldset>
			<fieldset>
				<legend>Order By</legend>
				<p>
					<form:label path="sortColumnType">Column</form:label><br/>
					<form:select path="sortColumnType" items="${sortColumnValues}" itemLabel="description"/>
				</p>

				<p>
					<form:label path="orderType">Order</form:label><br/>
					<form:select path="orderType" items="${orderValues}" itemLabel="description"/>
				</p>
			</fieldset>
		</form:form>
	</div>
	<div class="span-16 last">
		<table id="eventTable">
			<thead>
			<tr>
				<th class="span-6">Name</th>
				<th class="span-6">Date</th>
				<th class="span-12 last">Description</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${events}" var="event">
				<spring:url value="/events/{eventId}" var="loadEventUrl">
					<spring:param name="eventId" value="${event.id}"/>
				</spring:url>
				<tr>
					<td><a id="edit_${event.id}" class="edit" href="${loadEventUrl}">${event.name}</a></td>
					<td>${event.formattedEventDate}</td>
					<td>${event.description}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<script id="tmplEvent" type="text/x-jquery-tmpl">
		<tr>
			<td>{{= name}}</td>
			<td>{{= formattedEventDate}}</td>
			<td>{{= description}}</td>
		</tr>
	</script>
	<spring:url value="/events" var="eventsAjaxUrl"/>
	<script type="text/javascript">
		var loadDataTable = function() {
			$(function() {
				$.ajax("${eventsAjaxUrl}", {
					dataType: "json",
					data: $("#eventFilterForm").serializeArray(),
					success: function (data) {
						$("#eventTable tbody").empty();
						$("#tmplEvent").tmpl(data).appendTo("#eventTable");
					}
				});
			});
		};
		$("#eventFilterForm select").change(function() {
			loadDataTable();
		});
		$(function() {
			loadDataTable();
		});
	</script>
</div>
</body>
</html>