<%-- 
    Document   : historyComment
    Created on : 2022-4-15, 16:42:43
    Author     : WANG Weiran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>historyComment</title>
    </head>
    <body>
        <h1>HistoryComment</h1>
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
        <form:form action="/project/lecture/list" method="GET">
            <input type="submit" value="Cancel"/>
        </form:form>
    </body>
</html>
