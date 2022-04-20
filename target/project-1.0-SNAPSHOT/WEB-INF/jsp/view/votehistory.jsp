<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Vote History</title>
    </head>
    <body>
        <h1>Vote History</h1>
        <c:choose>
            <c:when test="${fn:length(votehistory) == 0}">
                <i>There are not vote history in the system.</i>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>Username</th><th>Question</th><th>mc</th>
                    </tr>
                    <c:forEach items="${votehistory}" var="usermc">
                        <tr>
                            <td>${usermc.username}</td>
                            <td>${usermc.question}</td>
                            <td>${usermc.mc}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
        <form:form action="/project/lecture/list" method="GET">
            <input type="submit" value="back"/>
        </form:form>
    </body>
</html>
