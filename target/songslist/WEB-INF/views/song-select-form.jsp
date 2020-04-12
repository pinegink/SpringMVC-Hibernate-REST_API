<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
    <title>Song catalog</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Song catalog</h2>
    </div>
</div>

<div id="container">

    <div id="content">
        
        <a href="${pageContext.request.contextPath}/song/add-new-in">Add new</a>
        <table>
            <tr>
                <th>id</th>
                <th>Name</th>
                <th>Band</th>
                <th>Year</th>
                <th>Add</th>
            </tr>

            <c:forEach var="song" items="${songs}">

                <c:url var="add" value="/song/add-to-playlist">
                    <c:param name="songId" value="${song.id}" />
                    <c:param name="playlistId" value="${playlistId}" />
                </c:url>

                <tr>
                    <td> ${song.id} </td>
                    <td> ${song.name} </td>
                    <td> ${song.band} </td>
                    <td> ${song.year} </td>
                    <td>
                        <a href="${add}">+</a>
                    </td>

                </tr>

            </c:forEach>

        </table>

    </div>

</div>
<br>
<a href="${pageContext.request.contextPath}/playlist/list">Back to playlists</a>
</body>

</html>









