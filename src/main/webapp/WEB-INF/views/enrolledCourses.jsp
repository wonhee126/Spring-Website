<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HSU 학사 정보 시스템-학년별 이수 학점 조회</title>
<%--    <link rel="stylesheet" type="text/css"--%>
<%--          href="${pageContext.request.contextPath}/resources/css/enrolledCourses.css" >--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/menubar.css" >
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/offers.css" >
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

<table border="1" class="offerTable">
    <thead>
    <tr class="oc-thead-tr">
        <th class="th">번호</th>
        <th class="th">수강년도</th>
        <th class="th">학기</th>
        <th class="th">교과코드</th>
        <th class="th">교과목명</th>
        <th class="th">교과구분</th>
        <th class="th">교수</th>
        <th class="th">학점</th>
    </tr>
    </thead>
    <tbody class="oc-tbody">
    <c:forEach var="offerList" items="${offerList}" varStatus="status">
        <tr>
            <td class="tbody-td"><c:out value="${status.index + 1}" /></td>
            <td class="tbody-td"><c:out value="${offerList.year}" /></td>
            <td class="tbody-td"><c:out value="${offerList.semester}" /></td>
            <td class="tbody-td"><c:out value="${offerList.courseCode}" /></td>
            <td class="tbody-td"><c:out value="${offerList.courseName}" /></td>
            <td class="tbody-td"><c:out value="${offerList.courseType}" /></td>
            <td class="tbody-td"><c:out value="${offerList.professor}" /></td>
            <td class="tbody-td"><c:out value="${offerList.credit}" /></td>
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
    };
</script>
</html>
