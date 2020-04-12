<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>
    <title>List songs</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>Playlists</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <input type="button" value="Add a playlist"
               onclick="window.location.href='add-in'; return false;"
               class="add-button"
        />

        <table>
            <tr>
                <th>Name</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <c:forEach var="playlist" items="${playlists}">

                <c:url var="updateLink" value="/playlist/update-in">
                    <c:param name="playlistId" value="${playlist.id}" />
                </c:url>
                <c:url var="deleteLink" value="/playlist/delete">
                    <c:param name="id" value="${playlist.id}" />
                </c:url>

                <tr>
                    <td> ${playlist.name} </td>
                    <td>
                        <a href="${updateLink}">Update</a>
                    </td>
                    <td>
                        <a href="${deleteLink}">Delete</a>
                    </td>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>


</body>

</html>









