<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HSU 학사 정보 시스템-학년별 이수 학점 조회</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/offers.css" >
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/menubar.css" >
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

<%--로그인한 유저 이름의 학년별 이수 학점 조회 출력 --%>
<div class="username">${username}님의 학년별 이수 학점 조회</div>

<table border="1" class="offerTable">
    <thead>
    <tr class="thead-tr">
        <th class="th">수강년도</th>
        <th class="th">학기</th>
        <th class="th">취득 학점</th>
        <th class="th">상세보기</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="year_semester_map" value="${year_semester_map}" />
    <c:set var="totalCredits" value="0" />
    <c:forEach var="year" items="${year_semester_map}">
        <c:forEach var="semester_entry" items="${year.value}">
            <tr class="content">
                <td class="tbody-td"><c:out value="${year.key}" /></td>
                <td class="tbody-td"><c:out value="${semester_entry.key}" /></td>
                <td class="tbody-td"><c:out value="${semester_entry.value}" /></td>
                <td class="tbody-td">
                    <div class="detail-link" data-year="${year.key}" data-semester="${semester_entry.key}">상세보기</div>
                </td>
                <c:set var="totalCredits" value="${totalCredits + semester_entry.value}" />
            </tr>
        </c:forEach>
    </c:forEach>
    <tr class="tbody-tr">
        <td colspan="2" class="td">총계</td>
        <td class="td"><c:out value="${totalCredits}" /></td>
        <td></td>
    </tr>
    </tbody>
</table>
<form id="logout"  action="<c:url value="/logout" />"method="post">
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>
</body>
<script>
    document.querySelectorAll(".detail-link").forEach(function (link) {
        link.addEventListener("click", function () {
            var year = this.getAttribute("data-year");
            var semester = this.getAttribute("data-semester");
            var url = "${pageContext.request.contextPath}/docreate?year=" + year + "&semester=" + semester;
            window.location.href = url;
        });
    });

    document.getElementById("main-link").onclick = function () {
        window.location.href = "${pageContext.request.contextPath}/";
    }; // 클릭 시 홈 화면으로 이동
</script>
</html>