<%--
  Created by IntelliJ IDEA.
  User: idonse
  Date: 22.05.2020
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses</title>
    <style>
        form fieldset {
            width: 40%;
            padding: 4px;
        }
        form fieldset label{
            display: block;
        }
    </style>
    <script>
        let disableForm = true
        <s:authorize access="hasRole('ROLE_USER')">
            disableForm = false
        </s:authorize>
        
        window.addEventListener("load", function (){
            if (disableForm){
                let inputs = document.querySelectorAll("form fieldset input, form fieldset textarea")
                for (let i=0; i<inputs.length; i++){
                    inputs[i].disabled = true
                }
            }
        })
    </script>
</head>
<body>
    <form method="post">
        <fieldset>
            <div>
                <label>Name</label>
                <input type="text" name="title" value="${course.title}">
            </div>
            <div>
                <label>Length</label>
                <input type="number" name="length" value="${course.length}">
            </div>
            <div>
                <label>Description</label>
                <textarea name="description" rows="7">${course.description}</textarea>
            </div>
            <div>
<%--                <s:authorize access="hasRole('ROLE_USER')">--%>
<%--                    <input type="submit" value="save">--%>
<%--                </s:authorize>--%>
                <input type="submit" value="save">
            </div>
        </fieldset>
    </form>
</body>
</html>
