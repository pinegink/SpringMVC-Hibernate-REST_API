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
        <h2>List of songs</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <input type="button" value="Add a song"
               onclick="window.location.href='add'; return false;"
               class="add-button"
        />

        <table>
            <tr>
                <th>id</th>
                <th>Name</th>
                <th>Band</th>
                <th>Year</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>

            <c:forEach var="song" items="${songs}">

                <c:url var="updateLink" value="/songs/update">
                    <c:param name="id" value="${song.id}" />
                </c:url>
                <c:url var="deleteLink" value="/songs/delete">
                    <c:param name="id" value="${song.id}" />
                </c:url>

                <tr>
                    <td> ${song.id} </td>
                    <td> ${song.name} </td>
                    <td> ${song.band} </td>
                    <td> ${song.year} </td>
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









