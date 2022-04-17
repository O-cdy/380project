<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 4/13/22
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
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
        <br /><br />

        <h2>Poll question: </h2><br>
        ${listvote.question}<br>


        <form:form method="post" modelAttribute="usermcform">
            <p>Please select :</p>
            <div>

                <%--            <form:label path="username">username</form:label><br/>--%>
                <%--            <form:input type="text" path="username" value="${usermcform.username}" /><br/><br/>--%>

                <%--            <form:label path="question">Password</form:label><br/>--%>
                <%--            <form:input type="text" path="question" value="${usermcform.question}" /><br/><br/>--%>



                <c:forEach items="${listvote.mc}" var="votemc">
                    <label for="${votemc.mc}">
                        <input type="radio" id="${votemc.mc}" path="mc"
                               name="mc" value="${votemc.mc}"  <c:if test="${ usermcform.mc == votemc.mc }">checked="checked"</c:if> >
                        ${votemc.mc}     (${votemc.count} selected)
                    </label><br>



                </c:forEach>
                >



            </div>
            <div>
                <button type="submit">save</button>
            </div>
        </form:form>

        [<a href="<c:url value="/lecture/list" />">back </a>]
        <h2>Comment: </h2><br>
        <security:authorize access="hasRole('ADMIN')">
            <c:choose>
                <c:when test="${fn:length(votecomments) == 0}">
                    <i>There are comment in the system.</i>
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
                                <td>
                                    [<a href="<c:url value="/vote/deletecomment/${votecomment.username}" />">Delete</a>]
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </security:authorize>

        <a href="<c:url value="/vote/create/comment" />">Write new comment</a><br /><br />


    </body>
</html>
