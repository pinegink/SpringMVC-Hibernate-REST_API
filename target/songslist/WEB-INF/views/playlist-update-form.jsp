<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
    <title>Update list</title>

    <!-- reference our style sheet -->

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Update playlist</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <c:url var="addSong" value="/playlist/song-select-in">
            <c:param name="playlistId" value="${playlistId}" />
        </c:url>

        <!-- put new button: Add Customer -->
        <a href="${addSong}">Add song</a>


        <c:url var="addSong" value="/playlist/song-select-in">
            <c:param name="playlistId" value="${playlistId}" />
        </c:url>

        <!--  add our html table here -->

        <table>
            <tr>
                <th>id</th>
                <th>Song</th>
                <th>Band</th>
                <th>Year</th>
                <th>Delete</th>
            </tr>

            <!-- loop over and print our customers -->
            <c:forEach var="song" items="${songs}">


                <!-- construct an "delete" link with customer id -->
                <c:url var="deleteLink" value="/playlist/update-delete-song">
                    <c:param name="songId" value="${song.id}" />
                    <c:param name="playlistId" value="${playlistId}" />
                </c:url>

                <tr>
                    <td> ${song.id} </td>
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
<input type="button" value="Back to playlists"
       onclick="window.location.href='list'; return false;"
       class="add-button"
/>
<a href="${pageContext.request.contextPath}/playlist/list">Back to playlists</a>
</html>









