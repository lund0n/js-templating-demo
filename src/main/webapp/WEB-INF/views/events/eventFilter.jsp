<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--@elvariable id="events" type="java.util.List<com.jeremylund.templating.model.Event>"--%>
<%--@elvariable id="years" type="java.util.List<java.lang.Integer>"--%>
<div id="sidebar">
	<form:form modelAttribute="eventFilterForm">
		<fieldset>
			<legend>Filter By</legend>
			<p>
				<form:label path="year">Year</form:label><br/>
				<form:select path="year" items="${years}"/>
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
	<script type="text/javascript">
		Spring.addDecoration(
				new Spring.AjaxEventDecoration({
					elementId:'year',
					event:'onchange',
					formId:'eventFilterForm',
					params:{
						fragments:"eventList"}}));
		Spring.addDecoration(
				new Spring.AjaxEventDecoration({
					elementId:'sortColumnType',
					event:'onchange',
					formId:'eventFilterForm',
					params:{
						fragments:"eventList"}}));
		Spring.addDecoration(
				new Spring.AjaxEventDecoration({
					elementId:'orderType',
					event:'onchange',
					formId:'eventFilterForm',
					params:{
						fragments:"eventList"}}));
	</script>
</div>