<%-- 
    Document   : addVoteComment
    Created on : 2022-4-16, 17:08:45
    Author     : WANG Weiran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Comment Management</title>
    </head>
    <body>
        <h2>Write a Comment</h2>
        <p>Username : ${principal.name}</p>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="Form">
            <form:label path="comment">Comment</form:label><br/>
            <form:input type="text" path="comment" /><br/><br/>
            <br /><br />
            <input type="submit" value="Add Comment"/>
        </form:form>
        <form:form action="/project/vote" method="GET">
            <input type="submit" value="Cancel"/>
        </form:form>
    </body>
</html>
