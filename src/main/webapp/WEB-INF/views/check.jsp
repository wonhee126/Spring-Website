<%--
  Created by IntelliJ IDEA.
  User: juwonhee
  Date: 4/2/24
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>HSU 학사 정보 시스템</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/check.css" >
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/menubar.css" >
</head>
<body class="body">
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

<div class="img"></div>
<div class="rectangle-17-2"></div>
<div class="success-message">수강 신청 성공</div>
<div class="rectangle-17"></div>
<a href="${pageContext.request.contextPath}/enrolledCourses">
    <div class="request-link-text">수강신청 조회 바로가기</div>
</a>
<form id="logout"  action="<c:url value="/logout" />"method="post">
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>
</body>

</html>
