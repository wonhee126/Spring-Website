<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2024-03-20
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Please sign in(Custom Login Form)</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/main.css" >
</head>
<body>
<div class="container">
    <form class="form-signin" method="post" action="<c:url value="/login" />">
        <h2 class="form-signin-heading">Please sign in</h2>

<%--        에러 메시지가 있으면 출력하는 코드--%>
        <c:if test="${not empty errorMsg}">
            <div style="color: #ff0000;"> <h3> ${errorMsg} </h3></div>
        </c:if>

        <c:if test="${not empty logoutMsg}">
            <div style="color: #0000ff;" > <h3> ${logoutMsg} </h3></div>
        </c:if>

        <table>
            <tr><td>Username:</td><td><input type="text" name="username" placeholder="Username"/></td></tr>
            <tr><td>Password:</td><td><input type="text" name="password" placeholder="Password"/></td></tr>
        </table>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"  />
        <button class="signInButton" type="submit">Sign In</button>
    </form>
</div>
</body>

</html>
