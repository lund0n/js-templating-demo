<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--@elvariable id="events" type="java.util.List<com.jeremylund.templating.model.Event>"--%>
<div id="eventList">
	<table>
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
	<script type="text/javascript">
		dojo.query("#eventList a.edit").forEach(function(element) {
			Spring.addDecoration(new Spring.AjaxEventDecoration({
				elementId: element.id,
				event: "onclick",
				params: { fragments: "sidebar" }
			}));
		});
	</script>
</div>