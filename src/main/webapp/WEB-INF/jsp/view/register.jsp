<!DOCTYPE html>
<html>
    <head><title>User Register</title></head>
    <body>
        <h2>Register</h2>
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
            <br /><br />
            <input type="submit" value="Register"/>
        </form:form>
    </body>
</html>
