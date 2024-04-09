<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2024-03-11
  Time: 오후 7:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>HSU 학사 정보 시스템-상세보기</title>
</head>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resources/css/offers.css" >
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/resources/css/menubar.css" >
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

<%--클릭한 년도와 학기 정보 출력--%>
<div class="description">${year}년 ${semester}학기 상세보기</div>

<table border="1" class="offerTable">
    <thead>
    <tr class="oc-thead-tr">
        <th class="oc-th">수강년도</th>
        <th class="oc-th">학기</th>
        <th class="oc-th">교과코드</th>
        <th class="oc-th">교과명</th>
        <th class="oc-th">교과구분</th>
        <th class="oc-th">교수</th>
        <th class="oc-th">학점</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td class="oc-tbody-td"><c:out value="${offer.year}" /></td>
            <td class="oc-tbody-td"><c:out value="${offer.semester}" /></td>
            <td class="oc-tbody-td"><c:out value="${offer.courseCode}" /></td>
            <td class="oc-tbody-td"><c:out value="${offer.courseName}" /></td>
            <td class="oc-tbody-td"><c:out value="${offer.courseType}" /></td>
            <td class="oc-tbody-td"><c:out value="${offer.professor}" /></td>
            <td class="oc-tbody-td"><c:out value="${offer.credit}" /></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<form id="logout"  action="<c:url value="/logout" />"method="post">
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>
</body>
<script>
    document.getElementById("main-link").onclick = function() {
        window.location.href = "${pageContext.request.contextPath}/";
    }; // 클릭 시 홈 화면으로 이동
</script>
</html>