<%--login.jsp--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/login.css" >
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/menubar.css" >
    <title>HSU 학사 정보 시스템-로그인</title>
</head>

<body>
<div class="menubar">
    <div id="main-link" class="main-link">HSU 학사 정보 시스템</div>
    <div class="login">
        <div class="rectangle3">
            <%--    login 안 되어있으면 login, login 되어있으면 logout을 보임--%>
            <c:choose>
                <c:when test="${empty pageContext.request.userPrincipal}">
                    <a href="${pageContext.request.contextPath}/login">
                        <div class="login_text">login</div>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="javascript:document.getElementById('logout').submit()">
                        <div class="login_text">logout</div>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<div class="container">
    <form class="form-signin" method="post" action="<c:url value="/login" />">
        <h2 class="pleaseLogin">Please Login</h2>
        <div class="img"></div>
<%--        에러 메시지가 있으면 출력하는 코드--%>
        <c:if test="${not empty errorMsg}">
        <div class="error"></div>
            <div class="error-text">${errorMsg}</div>
        </c:if>

        <c:if test="${not empty logoutMsg}">
            <div class="logout"></div>
            <div class="logout-text">${logoutMsg}</div>
        </c:if>

        <table>
            <tr><td><input class="username" type="text" name="username" placeholder ="Username"/></td></tr>
            <tr><td><input class="password" type="text" name="password" placeholder="Password"/></td></tr>
        </table>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"  />
        <button class="loginbtn" type="submit"></button>
            <div class="loginbtn-text">Login</div>
    </form>
</div>
</body>
<script>
    document.getElementById("main-link").onclick = function() {
        window.location.href = "${pageContext.request.contextPath}/";
    }; // 클릭 시 홈 화면으로 이동
</script>
</html>
