<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <title>Add course</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/add-style.css">
</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Courses</h2>
    </div>
</div>

<div id="container">
    <h3>Add song</h3>

    <form:form action="save" modelAttribute="song" method="POST">
        <form:hidden path="id" />
        <table>
            <tbody>
            <tr>
                <td><label>Name:</label></td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td><label>Band:</label></td>
                <td><form:input path="band" /></td>
            </tr>
            <tr>
                <td><label>Year:</label></td>
                <td><form:input path="year" /></td>
            </tr>

            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save" class="save" /></td>
            </tr>


            </tbody>
        </table>


    </form:form>

    <div style="clear; both;"></div>

    <p>
        <a href="${pageContext.request.contextPath}/songs/list">Back to List</a>
    </p>

</div>

</body>

</html>










