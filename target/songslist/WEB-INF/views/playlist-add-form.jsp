<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <title>Add new playlist</title>

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
        <h2>Add new playlist</h2>
    </div>
</div>

<div id="container">
    <br>

    <form:form action="add-out" modelAttribute="playlist" method="POST">

        <form:hidden path="id" />

        <table>
            <tbody>
            <tr>
                <td><label>Playlist name:</label></td>
                <td><form:input path="name" /></td>
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
        <a href="${pageContext.request.contextPath}/playlist/list">Back to playlists</a>
    </p>

</div>

</body>

</html>










