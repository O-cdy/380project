<!DOCTYPE html>
<html>
    <head>
        <title>Online Course Website Login</title>
    </head>
    <body>
        <c:if test="${param.error != null}">
            <font color="red"><p>Login failed.</p></font>
        </c:if>
        <c:if test="${param.logout != null}">
            <font color="red"><p>You have logged out.</p></font>
        </c:if>
        <c:if test="${param.success != null}">
            <font color="blue"><p>Register successfully!</p></font>
        </c:if>
        <h2>Online Course Website Login</h2>
        <form action="olelogin" method="POST">
            <label for="username">Username:</label><br/>
            <input type="text" id="username" name="username" /><br/><br/>
            <label for="password">Password:</label><br/>
            <input type="password" id="password" name="password" /><br/><br/>
            <input type="checkbox" id="remember-me" name="remember-me" />
            <label for="remember-me">Remember me</label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" value="Log In"/>
        </form>
        <form action="user/register" method="GET">
            <input type="submit" value="Register"/>
        </form>
        <form action="lecture/list" method="GET">
            <input type="submit" value="Back to Homepage"/>
        </form>
    </body>
</html>