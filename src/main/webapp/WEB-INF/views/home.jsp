<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2022/12/13
  Time: 12:55 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>학사 정보 시스템</title>
  </head>
  <body>
  <h1>Welcome, ${username}!</h1>
  <p> <a href="${pageContext.request.contextPath}/"> 학사 정보 시스템 </a></p>
    <p> <a href="${pageContext.request.contextPath}/createoffer"> 수강신청 하기 </a></p>
    <p> <a href="${pageContext.request.contextPath}/enrolledCourses"> 수강신청 조회 </a></p>
    <p> <a href="${pageContext.request.contextPath}/offers"> 학년별 이수 학점 조회 </a></p>

    <%--    login 안 되어있으면 login, login 되어있으면 logout을 보임--%>
    <c:choose>
        <c:when test="${empty pageContext.request.userPrincipal}">
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </c:when>
        <c:otherwise>
            <a href="javascript:document.getElementById('logout').submit()">Logout</a>
        </c:otherwise>
    </c:choose>
    <%--    login 안 되어있으면 login, login 되어있으면 logout을 보임--%>

    <form id="logout"  action="<c:url value="/logout" />"method="post">
      <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
    </form>

  </body>
</html>
