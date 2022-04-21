<!DOCTYPE html>
<html>
    <head><title>User Management</title></head>
    <body>
        <c:url var="logoutUrl" value="/cslogout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Create a User</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureUser">
            <form:label path="username">Username</form:label><br/>
            <form:input type="text" path="username" /><br/><br/>
            <form:label path="password">Password</form:label><br/>
            <form:input type="text" path="password" /><br/><br/>
            <form:label path="fullname">Fullname</form:label><br/>
            <form:input type="text" path="fullname" /><br/><br/>
            <form:label path="phone">Phone Number</form:label><br/>
            <form:input type="text" path="phone" /><br/><br/>
            <form:label path="address">Address</form:label><br/>
            <form:input type="text" path="address" /><br/><br/>
            <form:label path="roles">Roles</form:label><br/>
            <form:checkbox path="roles" value="ROLE_USER" />ROLE_USER
            <form:checkbox path="roles" value="ROLE_ADMIN" />ROLE_ADMIN
            <br /><br />
            <input type="submit" value="Create"/>
        </form:form>
        <form:form action="/project/user" method="GET">
            <input type="submit" value="Cancel"/>
        </form:form>
    </body>
</html>
