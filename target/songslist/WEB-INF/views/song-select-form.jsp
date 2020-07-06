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
        <c:url var="addNew" value="/song/add-new-in">
            <c:param name="playlistId" value="${playlistId}" />
        </c:url>

        <a href="${addNew}">Add new</a>
        <table>
            <tr>
                <th>Name</th>
                <th>Band</th>
                <th>Year</th>
                <th>Select</th>
                <th>Delete from catalog</th>
            </tr>

            <c:forEach var="song" items="${songs}">

                <c:url var="add" value="/song/add-to-playlist">
                    <c:param name="songId" value="${song.id}" />
                    <c:param name="playlistId" value="${playlistId}" />
                </c:url>
                <c:url var="deleteLink" value="/song/delete-from-catalog">
                    <c:param name="songId" value="${song.id}" />
                    <c:param name="playlistId" value="${playlistId}" />
                </c:url>

                <tr>
                    <td> ${song.name} </td>
                    <td> ${song.band} </td>
                    <td> ${song.year} </td>
                    <td>
                        <a href="${add}">+</a>
                    </td>
                    <td>
                        <a href="${deleteLink}">delete</a>
                    </td>

                </tr>

            </c:forEach>

        </table>

    </div>

</div>
<c:url var="backToPlaylist" value="/playlist/update-in">
    <c:param name="playlistId" value="${playlistId}" />
</c:url>
<br>
<a href="${backToPlaylist}">Back to playlist</a>
</body>

</html>









