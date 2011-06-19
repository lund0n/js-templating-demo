<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
<head>
    <title>Templating Demos - Example 1</title>
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
        <h1>Example 1</h1>
        <hr/>
    </div>
    <div class="span-12">
        <form:form modelAttribute="entryForm">
            <fieldset>
                <legend>Registration</legend>
                <p>
                    <form:label path="firstName">First Name</form:label>
                    <form:errors path="firstName" cssStyle="color: #8a1f11"/><br/>
                    <form:input path="firstName"/>
                </p>
                <%--<script type="text/javascript">
					Spring.addDecoration(new Spring.ElementDecoration({
						elementId : "firstName",
						widgetType : "dijit.form.ValidationTextBox",
						widgetAttrs : { required : true, promptMessage: "Please enter a first name." }}));
				</script>--%>

                <p>
                    <form:label path="lastName">Last Name</form:label>
                    <form:errors path="lastName" cssStyle="color: #8a1f11"/><br/>
                    <form:input path="lastName"/>
                </p>
                <%--<script type="text/javascript">
					Spring.addDecoration(new Spring.ElementDecoration({
						elementId : "lastName",
						widgetType : "dijit.form.ValidationTextBox",
						widgetAttrs : { required : true, promptMessage: "Please enter a last name." }}));
				</script>--%>

                <p>
                    <form:label path="userName">User Name</form:label>
                    <form:errors path="userName" cssStyle="color: #8a1f11"/><br/>
                    <form:input path="userName"/><br/>
                </p>
                <%--<script type="text/javascript">
					Spring.addDecoration(new Spring.ElementDecoration({
						elementId : "userName",
						widgetType : "dijit.form.ValidationTextBox",
						widgetAttrs : { required : true }}));
				</script>--%>

                <p>
                    <form:label path="birthDate">Birthdate</form:label>
                    <form:errors path="birthDate" cssStyle="color: #8a1f11"/><br/>
                    <form:input path="birthDate"/><br/>
                </p>
                <%--<script type="text/javascript">
					Spring.addDecoration(new Spring.ElementDecoration({
						elementId : "birthDate",
						widgetType : "dijit.form.ValidationTextBox",
						widgetAttrs : { required : true }}));
				</script>--%>



                <p>
                    <input id="submitForm" type="submit" value="Register"/>
                    <spring:url value="/" var="cancelUrl"/>
                    <a href="${cancelUrl}">cancel</a>
                </p>
                <%--<script type="text/javascript">
                    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'submitForm', event:'onclick'}));
                </script>--%>
            </fieldset>
        </form:form>
    </div>
</div>
</body>
</html>