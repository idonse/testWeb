<%--
  Created by IntelliJ IDEA.
  User: idonse
  Date: 22.05.2020
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses</title>
</head>
<body>
    <h1>Courses</h1>
    <div id="userinfo">
        <s:authorize access="isAuthenticated()">
            Hey, <s:authentication property="principal.username"/>!
            <br/>
            <a href="../j_spring_security_logout">Exit</a>
        </s:authorize>
    </div>
    <s:authorize access="isAnonymous()">
        <form id="login" name="loginForm" action="../j_spring_security_check" method="post">
            <label>Login:</label>
            <input type="text" name="j_username">
            <label>Password:</label>
            <input type="password" name="j_password">
            <input type="submit" name="submit" value="Sign In">
        </form>
    </s:authorize>
    <c:if test="${not empty courses}">
        <table border="1">
            <tr>
                <td>Name</td>
                <td>Hours</td>
                <td>Description</td>
                <s:authorize access="hasRole('ROLE_USER')">
                    <td></td>
                    <td></td>
                </s:authorize>
            </tr>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.title}</td>
                    <td>${course.length}</td>
                    <td>${course.description}</td>
                    <s:authorize access="hasRole('ROLE_USER')">
                        <td><a href="update/${course.id}">Change</a> </td>
                        <td><a href="delete/${course.id}">Delete</a> </td>
                    </s:authorize>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <s:authorize access="hasRole('ROLE_USER')">
        <a href="update/0">Add new</a>
    </s:authorize>
</body>
</html>
