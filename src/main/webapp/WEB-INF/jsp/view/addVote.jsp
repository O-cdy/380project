<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Poll Question Management</title>
    </head>
    <body>

        <c:url var="logoutUrl" value="/cslogout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Create a Poll Question</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="Vote">
            <form:label path="question">Question</form:label><br/>
            <form:input type="text" path="question" placeholder=""/><br/><br/>

            <form:label path="mc_a">A : </form:label>
            <form:input type="text" path="mc_a" placeholder="" /><br>

            <form:label path="mc_b">B : </form:label>
            <form:input type="text" path="mc_b" placeholder="" /><br>

            <form:label path="mc_c">C : </form:label>
            <form:input type="text" path="mc_c" placeholder="" /><br>

            <form:label path="mc_d">D : </form:label>
            <form:input type="text" path="mc_d" placeholder="" /><br>

            <br />
            <input type="submit" value="Create"/>
        </form:form>
        <form:form action="/project/lecture" method="GET">
            <input type="submit" value="Cancel"/>
        </form:form>
    </body>
</html>
