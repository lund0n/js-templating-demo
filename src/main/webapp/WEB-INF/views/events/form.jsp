<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div id="sidebar">
	<form:form modelAttribute="event">
		<fieldset>
			<legend><tiles:getAsString name="formTitle"/></legend>
			<p>
				<form:label path="name">Name</form:label>
				<form:errors path="name" cssStyle="color: #8a1f11"/><br/>
				<form:input path="name"/>
			</p>

			<p>
				<form:label path="eventDate">Date</form:label>
				<form:errors path="eventDate" cssStyle="color: #8a1f11"/><br/>
				<form:input path="eventDate"/>
			</p>

			<p>
				<form:label path="description">Description</form:label>
				<form:errors path="description" cssStyle="color: #8a1f11"/><br/>
				<form:textarea path="description" cols="20" cssStyle="width:200px;height:200px"/>
			</p>

			<p>
				<input id="submitForm" type="submit" value="Save"/>
				<spring:url value="/events" var="eventsUrl"/>
				<a id="cancelForm" href="${eventsUrl}">cancel</a>
			</p>
		</fieldset>
	</form:form>
	<script type="text/javascript">
		Spring.addDecoration(
				new Spring.AjaxEventDecoration({
					elementId:'submitForm',
					event:'onclick',
					formId:'event',
					params:{
						fragments:"sidebar"}}));
		Spring.addDecoration(new Spring.AjaxEventDecoration({
			elementId: "cancelForm",
			event: "onclick",
			params: { fragments: "eventList,sidebar" }
		}));

	</script>
</div>