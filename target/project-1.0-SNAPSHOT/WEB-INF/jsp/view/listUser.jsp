<!DOCTYPE html>
<html>
    <head><title>User Management</title></head>
    <body>
        <c:url var="logoutUrl" value="/olelogout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <br /><br />
        <a href="<c:url value="/lecture" />">Return to list lectures</a>
        <h2>Users</h2>
        <a href="<c:url value="/user/create" />">Create a User</a><br /><br />
        <c:choose>
            <c:when test="${fn:length(lectureUsers) == 0}">
                <i>There are no users in the system.</i>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>Username</th><th>Password</th><th>Full Name</th><th>Phone</th><th>Address</th><th>Roles</th><th>Action</th>
                    </tr>
                    <c:forEach items="${lectureUsers}" var="user">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.password.substring(6)}</td>
                            <td>${user.fullname}</td>
                            <td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>
                                <c:forEach items="${user.roles}" var="role" varStatus="status">
                                    <c:if test="${!status.first}">, </c:if>
                                    ${role.role}
                                </c:forEach>
                            </td>
                            <td>
                                [<a href="<c:url value="/user/delete/${user.username}" />">Delete</a>]
                                [<a href="<c:url value="/user/edit/${user.username}" />">Edit</a>]
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </body>