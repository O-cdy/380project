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

        <h2>Poll question: </h2><br>
        ${listvote.question}<br>

        <form:form method="post" modelAttribute="usermcform">
            <p>Please select :</p>
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

        [<a href="<c:url value="/lecture/list" />">Back </a>]
        <h2>Vote Comment: </h2><br>
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

        <a href="<c:url value="/vote/create/comment" />">Write new comment</a><br /><br />


    </body>
</html>
