<!DOCTYPE html>
<html>
    <head>
        <title>Lecture Detail</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/olelogout"/>
        <form:form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form:form>
        <h2>Lecture #${lectureId}: <c:out value="${lecture.lectureTitle}" /></h2>
        <security:authorize access="hasRole('ADMIN') or principal.username=='${lecture.lecturer}'">
            [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">
            [<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]
        </security:authorize>
        <i>Lecturer - <c:out value="${lecture.lecturer}" /></i><br /><br />
        <c:if test="${fn:length(lecture.attachments) > 0}">
            <p>Attachments:</p>
            Lecture Notes:<br />
            <%--<c:if test="${!status.first}">, </c:if>--%>
            <c:forEach items="${lecture.attachments}" var="attachment"
                       varStatus="status">
                <ul>
                    <c:if test="${attachment.fileType=='lectureNotes'}">
                        <li><a href="<c:url value="/lecture/${lecture.id}/attachment/${attachment.name}" />">
                                <c:out value="${attachment.name}" /></a></li>
                            </c:if>
                </ul>
            </c:forEach><br />

            Tutorial Notes:<br />
            <c:forEach items="${lecture.attachments}" var="attachment"
                       varStatus="status">
                <ul>
                    <c:if test="${attachment.fileType=='tutorialNotes'}">
                        <li><a href="<c:url value="/lecture/${lecture.id}/attachment/${attachment.name}" />">
                                <c:out value="${attachment.name}" /></a></li>
                            </c:if>
                </ul>
            </c:forEach><br />
        </c:if>

        <h2>Lecture Comment: </h2><br>
        <security:authorize access="hasAnyRole('USER','ADMIN')"> 
            <c:choose>
                <c:when test="${fn:length(comments) == 0}">
                    <i>There are comment in the system.</i>
                </c:when>
                <c:otherwise>
                    <table>
                        <tr>
                            <th>Username</th><th>Comment</th>
                        </tr>
                        <c:forEach items="${comments}" var="comment">
                            <tr>
                                <td>${comment.username}</td>
                                <td>${comment.comment}</td>
                                <security:authorize access="hasRole('ADMIN')">
                                    <td>
                                        [<a href="<c:url value="/lecture/deletecomment/${comment.id}" />">Delete</a>]
                                    </td>
                                </security:authorize>
                            </tr>
                        </c:forEach>
                    </table>
                </c:otherwise>
            </c:choose>
        </security:authorize>

        <a href="<c:url value="/lecture/create/comment" />">Write new comment</a><br /><br />

        <a href="<c:url value="/lecture" />">Return to list lectures</a>
    </body>
</html>