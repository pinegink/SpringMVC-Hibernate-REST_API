<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/index.css" />
</head>
<body>
<h3>Songs storage</h3>
The goal of the app was to practise in database handling<br/><br/>
Stack: Spring MVC + Postgres & Hibernate + REST + Tomcat<br/><br/>
Running: AWS Elastic Beanstalk<br/><br/>
<a href="https://github.com/pinegink/SpringMVC-Hibernate-REST_API">Source code</a><br/><br/>
Description: The app is a catalog of songs. Songs can be grouped by playlists.<br/><br/>
Database schema:<br/><br/>
<img src="<c:url value="/resources/images/1_entity-diagram.png"></c:url>"/>
<p>
    <a href="${pageContext.request.contextPath}/playlist/list">To the app</a>
</p>
</body>
</html>
