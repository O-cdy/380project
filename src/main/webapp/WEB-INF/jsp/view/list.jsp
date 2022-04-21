<!DOCTYPE html>
<html>
    <head>
        <title>COMPS380F</title>
    </head>
    <body>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <form:form action="/project/olelogin" method="GET">
                <input type="submit" value="Log in"/>
            </form:form>
        </c:if>

        <security:authorize access="hasAnyRole('USER','ADMIN')"> 
            <p><i> Welcome </i>, ${principal.name} !</p>

            <c:url var="logoutUrl" value="/olelogout"/>
            <form:form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>

        </security:authorize>

        <h1>Course: COMPS380F</h1>
        <security:authorize access="hasRole('ADMIN')"> 
            <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
        </security:authorize>
        <h2>Lecture List</h2>
        <security:authorize access="hasRole('ADMIN')"> 
            <a href="<c:url value="/lecture/create" />">Create a Lecture</a><br /><br />
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                <i>There are no lecture in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${lectureDatabase}" var="lecture">
                    Lecture ${lecture.id}:
                    <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                        <a href="<c:url value="/lecture/view/${lecture.id}" />">
                        </security:authorize>
                        <c:out value="${lecture.lectureTitle}" />
                        <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                        </a>
                    </security:authorize>

                    (Lecturer: ${lecture.lecturer})
                    <security:authorize access="hasRole('ADMIN')">
                        <security:authorize access="principal.username=='${lecture.lecturer}'">
                            [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]
                        </security:authorize>
                    </security:authorize>
                    <security:authorize access="hasRole('ADMIN')">
                        [<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]
                    </security:authorize>
                    <br />
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <br><br>
        <!--vote page part -->
        <h2>Poll Question List </h2>

        <security:authorize access="hasAnyRole('ADMIN')">
            <a href="<c:url value="/vote/add" />">Create a Poll Question</a><br /><br />
        </security:authorize>
        <c:choose>
            <c:when test="${fn:length(votes) == 0}">
                <i>There are no poll question in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${votes}" var="vote">
                    Poll question:
                    [
                    <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                        <a href="<c:url value="/vote/edit/${vote.question}" />">
                        </security:authorize>
                        ${vote.question}
                        <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                        </a>
                    </security:authorize>
                    ]
                    <security:authorize access="hasAnyRole('ADMIN')">
                        [<a href="<c:url value="/vote/delete/${vote.question}" />">Delete</a>]<br>
                    </security:authorize><br>

                </c:forEach>
            </c:otherwise>
        </c:choose>

        <br><br><br>
        <security:authorize access="hasAnyRole('USER','ADMIN')">
            [<a href="<c:url value="/vote/commentHistory" />">view history comments</a>]
        </security:authorize>

        <security:authorize access="hasAnyRole('USER','ADMIN')">
            [<a href="<c:url value="/vote/voteHistory" />">view history vote</a>]
        </security:authorize>


    </body>
