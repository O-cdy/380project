<!DOCTYPE html>
<html>
    <head><title>User Management</title></head>
    <body>
        <c:url var="logoutUrl" value="/cslogout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>User - ${userForm.username}</h2>
        <form:form method="POST" enctype="multipart/form-data" 
                   modelAttribute="userForm">
            <form:label path="password">Password</form:label><br/>
            <form:input type="text" path="password" value="${userForm.password}" /><br/><br/>
            <form:label path="fullname">Fullname</form:label><br/>
            <form:input type="text" path="fullname" value="${userForm.fullname}" /><br/><br/>
            <form:label path="phone">Phone Number</form:label><br/>
            <form:input type="text" path="phone" value="${userForm.phone}" /><br/><br/>
            <form:label path="address">Address</form:label><br/>
            <form:input type="text" path="address" value="${userForm.address}" /><br/><br/>
            <form:label path="roles">Roles</form:label><br/>
            <c:forEach items="${user.roles}" var="role" varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                ${role.role}
            </c:forEach>
            <br /><br />
            <input type="submit" value="Update"/>
        </form:form>
    </body>
</html>
