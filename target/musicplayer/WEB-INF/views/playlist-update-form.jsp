<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
    <title>Update list</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Playlist content</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <c:url var="addSong" value="/playlist/song-select-in">
            <c:param name="playlistId" value="${playlistId}" />
        </c:url>


        <a href="${addSong}">Add from catalog</a>


        <table>
            <tr>
                <th>Song</th>
                <th>Band</th>
                <th>Year</th>
                <th>Delete</th>
            </tr>

            <c:forEach var="song" items="${songs}">

                <c:url var="deleteLink" value="/playlist/update-delete-song">
                    <c:param name="songId" value="${song.id}" />
                    <c:param name="playlistId" value="${playlistId}" />
                </c:url>

                <tr>
                    <td> ${song.name} </td>
                    <td> ${song.band} </td>
                    <td> ${song.year} </td>

                    <td>
                        <a href="${deleteLink}">Delete</a>
                    </td>

                </tr>

            </c:forEach>

        </table>
    </div>

</div>


</body>
<br>
<a href="${pageContext.request.contextPath}/playlist/list">Back to playlists</a>
</html>









