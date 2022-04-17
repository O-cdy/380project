<!DOCTYPE html>
<html>
    <head>
        <title>Lecture Management</title>
    </head>
    <body>
        <h2>Lecture #${lectureId}</h2>
        <form:form method="POST" enctype="multipart/form-data" 
                   modelAttribute="lectureForm">
            <p>Lecturer : ${lecture.lecturer}</p>
            <form:label path="lectureTitle">Lecture Title</form:label><br/>
            <form:input type="text" path="lectureTitle" /><br/><br/>
            <c:if test="${fn:length(lecture.attachments) > 0}">
                <b>Attachments:</b><br/><br/>
                Lecture Notes:
                <ul>
                    <c:forEach items="${lecture.attachments}" var="attachment">
                        <c:if test="${attachment.fileType=='lectureNotes'}">
                            <li>
                                <c:out value="${attachment.name}" />
                                [<a href="<c:url value="/lecture/${lectureId}/delete/${attachment.name}" />">Delete</a>]
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
                Tutorial Notes:
                <ul>
                    <c:forEach items="${lecture.attachments}" var="attachment">
                        <c:if test="${attachment.fileType=='tutorialNotes'}">
                            <li>
                                <c:out value="${attachment.name}" />
                                [<a href="<c:url value="/lecture/${lectureId}/delete/${attachment.name}" />">Delete</a>]
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>

            </c:if>
            <b>Add attachments</b><br /><br/>
            Lecture Notes<br />
            <input type="file" name="lectureAttachments" multiple="multiple" /><br /><br />
            Tutorial Notes<br />
            <input type="file" name="tutorialAttachments" multiple="multiple" /><br /><br />
            <input type="submit" value="Save"/>
        </form:form>
    </body>
</html> 