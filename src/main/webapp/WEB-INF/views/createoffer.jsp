<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2024-03-11
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>HSU 학사 정보 시스템-수강신청 하기</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/main.css" >
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
<sf:form method="post" action="${pageContext.request.contextPath}/check" modelAttribute="offer">
        <table class="formtable">
            <tr>
                <td colspan="2" class="label"> 수강년도</td>
                <td><sf:input class="control" type="text" path="year"/>  <br/>
                    <sf:errors path="year" class="error"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label">학기</td>
                <td><sf:input class="control" type="text" path="semester"/> <br/>
                    <sf:errors path="semester" class="error" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"> 교과코드</td>
                <td><sf:input class="control" type="text" path="courseCode"/> <br/>
                    <sf:errors path="courseCode" class="error" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"> 교과목명</td>
                <td><sf:input class="control" type="text" path="courseName"/>  <br/>
                    <sf:errors path="courseName" class="error"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"> 교과구분</td>
                <td><sf:input class="control" type="text" path="courseType"/>  <br/>
                    <sf:errors path="courseType" class="error"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label">담당교수</td>
                <td><sf:input class="control" type="text" path="professor"/>  <br/>
                    <sf:errors path="professor" class="error"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label">학점</td>
                <td><sf:input class="control" type="text" path="credit"/>  <br/>
                    <sf:errors path="credit" class="error"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" value="수강신청" class="submit-btn"/>
                </td>
            </tr>
        </table>
        </sf:form>

<c:if test="${not empty errorMsg}">
    <div class="existError">${errorMsg}</div>
</c:if>

<form id="logout"  action="<c:url value="/logout" />"method="post">
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>
</body>
<script>
    document.getElementById("main-link").onclick = function() {
        window.location.href = "${pageContext.request.contextPath}/"; };
</script>
</html>