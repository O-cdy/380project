<!DOCTYPE html>
<html>
    <head>
        <title>Lecture Management</title>
    </head>
    <body>
        <h2>Create a Lecture</h2>
        <p>Lecturer : ${principal.name}</p>
        <form:form method="POST" enctype="multipart/form-data"
                   modelAttribute="lectureForm">
            <form:label path="lectureTitle">Lecture Title</form:label><br />
            <form:input type="text" path="lectureTitle" /><br /><br />
            <b>Attachments</b><br />
            <p>Lecture Notes</p>
            <input type="file" name="lectureAttachments" multiple="multiple" /><br /><br />
            <p>Tutorial Notes</p>
            <input type="file" name="tutorialAttachments" multiple="multiple" /><br /><br />
            <input type="submit" value="Create"/>
        </form:form>
        <form:form action="/project/lecture/list" method="GET">
                <input type="submit" value="Cancel"/>
        </form:form>
    </body>
</html>
