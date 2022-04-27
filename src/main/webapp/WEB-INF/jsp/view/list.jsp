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

            <c:url var="logoutUrl" value="/olelogout"/>
            <form:form action="${logoutUrl}" method="post">
                <i> Welcome </i>, ${principal.name} ! &nbsp;&nbsp;
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form:form>

        </security:authorize>

        <h1>Course: COMPS380F</h1>
        <security:authorize access="hasRole('ADMIN')"> 
            <a href="<c:url value="/user" />">Manage User Accounts</a><br />
        </security:authorize>
        <h2>Lecture List</h2>
        <label>
            <security:authorize access="hasRole('ADMIN')"> 
                <a href="<c:url value="/lecture/create" />">Create a Lecture</a><br /><br />
            </security:authorize>
        </label>
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                <i>There are no lecture in the system.</i>
            </c:when>
            <c:otherwise>
                <ul type="circle">
                    <c:forEach items="${lectureDatabase}" var="lecture">
                        <li>

                            <b>Lecture ${lecture.id}</b>

                            <label>
                                --
                                <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                                    <a href="<c:url value="/lecture/view/${lecture.id}" />">
                                    </security:authorize>
                                    <c:out value="${lecture.lectureTitle}" />
                                    <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                                    </a>
                                </security:authorize>
                            </label>
                            <label>
                                <security:authorize access="hasRole('ADMIN')">
                                    <security:authorize access="principal.username=='${lecture.lecturer}'">
                                        [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]
                                    </security:authorize>
                                </security:authorize>
                                <security:authorize access="hasRole('ADMIN')">
                                    [<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]
                                </security:authorize>
                            </label>

                            <br />
                            <label>Lecturer: ${lecture.lecturer}</label>


                        </li>
                        <br />
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>

        <!--vote page part -->
        <h2>Poll Question List </h2>
        <label>
            <security:authorize access="hasAnyRole('ADMIN')">
                <a href="<c:url value="/vote/add" />">Create a Poll Question</a><br />
            </security:authorize>
        </label>
        <c:choose>
            <c:when test="${fn:length(votes) == 0}">
                <br />
                <i>There are no poll question in the system.</i>
                <br />
            </c:when>
            <c:otherwise>
                <ol>
                    <c:forEach items="${votes}" var="vote">
                        <li>
                            <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                                <a href="<c:url value="/vote/edit/${vote.question}" />">
                                </security:authorize>
                                ${vote.question}
                                <security:authorize access="hasAnyRole('USER','ADMIN')"> 
                                </a>
                            </security:authorize>

                            <security:authorize access="hasAnyRole('ADMIN')">
                                [<a href="<c:url value="/vote/delete/${vote.question}" />">Delete</a>]
                            </security:authorize>
                        </li>
                        <br />
                    </c:forEach>
                </ol>
            </c:otherwise>
        </c:choose>

        <br>
        <security:authorize access="hasAnyRole('USER','ADMIN')">
            [<a href="<c:url value="/vote/commentHistory" />">View Comment History</a>]
        </security:authorize>

        <security:authorize access="hasAnyRole('USER','ADMIN')">
            [<a href="<c:url value="/vote/voteHistory" />">View Vote History</a>]
        </security:authorize>


    </body>
