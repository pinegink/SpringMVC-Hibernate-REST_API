<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <title>Add new song</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Add new song</h2>
    </div>
</div>

<div id="container">
    <h3>Add new song</h3>

    <form:form action="/song/add-new-out" modelAttribute="song" method="POST">

        <form:hidden path="id" />

        <table>
            <tbody>
            <tr>
                <td><label>name:</label></td>
                <td><form:input path="name" /></td>
            </tr>
            <tr>
                <td><label>band:</label></td>
                <td><form:input path="band" /></td>
            </tr>
            <tr>
                <td><label>year:</label></td>
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
    <c:url var="toPlaylist" value="/playlist/song-select-in">
        <c:param name="playlistId" value="${playlistId}" />
    </c:url>

    <p>
        <a href="${toPlaylist}">Back to catalog</a>
    </p>

</div>

</body>

</html>










