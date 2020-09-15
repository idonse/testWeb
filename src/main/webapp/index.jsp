<%@ page import="java.time.LocalTime" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Hey</title>
</head>
<body>
<h1>
    <%
        LocalTime now = LocalTime.now();
        out.print(String.format("Current server time: %tR", now));
        String s = String.format("Current server time: %tR", now);
    %>
</h1>
    <h2>Hello World!</h2>
<h2><%=s%></h2>
<h2>
    <c:out value="${12+4*5}"/>
    <c:set var="salary" value="${ 32*32}" scope="session"/>
</h2>
<h3>
    <c:if test="${salary > 100}">
        <p> Salary = <c:out value="${salary}"/></p>
    </c:if>
</h3>
</body>
</html>
