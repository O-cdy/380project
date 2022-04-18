<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 4/18/22
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>HistoryComment</h1>
<c:choose>
    <c:when test="${fn:length(votehistory) == 0}">
        <i>There are not vote history in the system.</i>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>Username</th><th>question</th><th>mc</th>
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
