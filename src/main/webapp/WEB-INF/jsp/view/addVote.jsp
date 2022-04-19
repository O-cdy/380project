<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:url var="logoutUrl" value="/cslogout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<h2>Create a poll question</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="Vote">
    <form:label path="question">question</form:label><br/>
    <form:input type="text" path="question" placeholder="please enter the poll question"/><br/><br/>

    <form:label path="mc_a">A:</form:label>
    <form:input type="text" path="mc_a" placeholder="please enter " /><br>

    <form:label path="mc_b">B:</form:label>
    <form:input type="text" path="mc_b" placeholder="please enter " /><br>

    <form:label path="mc_c">C:</form:label>
    <form:input type="text" path="mc_c" placeholder="please enter " /><br>

    <form:label path="mc_d">D:</form:label>
    <form:input type="text" path="mc_d" placeholder="please enter " /><br>


    <br /><br />
    <input type="submit" value="Add poll question"/>
</form:form>
</body>
</html>
