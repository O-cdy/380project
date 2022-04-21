<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comment History</title>
    </head>
    <body>
        <h1>Comment History</h1>
        <c:choose>
            <c:when test="${fn:length(allcomments) == 0}">
                <i>There are comment in the system.</i>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>Username</th><th>Comment</th>
                    </tr>
                    <c:forEach items="${allcomments}" var="allcomment">
                        <tr>
                            <td>${allcomment.username}</td>
                            <td>${allcomment.comment}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <br /><br />
        <form:form action="/project/lecture/list" method="GET">
            <input type="submit" value="Back"/>
        </form:form>
    </body>
</html>
