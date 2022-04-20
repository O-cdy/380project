<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/olelogout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Poll question: </h2>
        ${listvote.question}<br>

        <form:form method="post" modelAttribute="usermcform">
            <div>
                <c:forEach items="${listvote.mc}" var="votemc">
                    <label for="${votemc.mc}">
                        <input type="radio" id="${votemc.mc}" path="mc"
                               name="mc" value="${votemc.mc}"  <c:if test="${ usermcform.mc == votemc.mc }">checked="checked"</c:if> >
                        ${votemc.mc}     (${votemc.count} selected)
                    </label><br>
                </c:forEach>
            </div>
            <div>
                <button type="submit">save</button>
            </div>
        </form:form>

        <h2>Vote Comment: </h2>
        <security:authorize access="hasAnyRole('USER','ADMIN')"> 
            <c:choose>
                <c:when test="${fn:length(votecomments) == 0}">
                    <i>There are no comments in the system.</i>
                </c:when>
                <c:otherwise>
                    <table>
                        <tr>
                            <th>Username</th><th>Comment</th>
                        </tr>
                        <c:forEach items="${votecomments}" var="votecomment">
                            <tr>
                                <td>${votecomment.username}</td>
                                <td>${votecomment.comment}</td>
                                <security:authorize access="hasRole('ADMIN')">
                                    <td>
                                        [<a href="<c:url value="/vote/deletecomment/${votecomment.id}" />">Delete</a>]
                                    </td>
                                </security:authorize>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </security:authorize>

        <br>
        <form:form action="/project/vote/create/comment" method="GET">
            <input type="hidden" name="question" value="${listvote.question}"/>
            <input type="submit" value="Write new comment"/>
        </form:form>
        <br>
        <form:form action="/project/lecture/list" method="GET">
            <input type="submit" value="Back"/>
        </form:form>

    </body>
</html>
