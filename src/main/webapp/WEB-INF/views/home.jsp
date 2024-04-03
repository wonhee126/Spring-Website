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
      <link rel="stylesheet" type="text/css"
            href="${pageContext.request.contextPath}/resources/css/home.css" >
      <link rel="stylesheet" type="text/css"
            href="${pageContext.request.contextPath}/resources/css/menubar.css" >
    <title>HSU 학사 정보 시스템</title>
  </head>
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
  <div class="left-rec">
      <div class="left-img"></div>
  </div>
  <a href="${pageContext.request.contextPath}/offers">
  <div class="left-text">학년별 이수 학점 조회</div>>
  </a>
  <div class="center-rec">
      <div class="center-img"></div>
  </div>
  <a href="${pageContext.request.contextPath}/createoffer">
      <div class="center-text">수강 신청 하기</div>
  </a>
  <div class="right-rec">
      <div class="right-img"></div>
  </div>
  <a href="${pageContext.request.contextPath}/enrolledCourses">
      <div class="right-text">수강 신청 조회</div>
  </a>

<%--  <h1>Welcome, ${username}!</h1>--%>



    <form id="logout"  action="<c:url value="/logout" />"method="post">
      <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
    </form>

  </body>
  <script>
      document.getElementById("main-link").onclick = function() {
          window.location.href = "${pageContext.request.contextPath}/";
      };
  </script>
</html>
