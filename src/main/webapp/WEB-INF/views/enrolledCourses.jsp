<%--enrolledCourses.jsp--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HSU 학사 정보 시스템-수강신청 조회</title>
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

<%--로그인한 유저 이름의 수강신청 조회 출력 --%>
<div class="username">${username}님의 수강신청 조회</div>

<c:if test="${not empty errorMsg}">
    <div class="error-msg">${errorMsg}</div>
</c:if>

<table border="1" class="offerTable">
    <thead>
    <tr class="oc-thead-tr">
        <th>번호</th>
        <th>수강년도</th>
        <th>학기</th>
        <th>교과코드</th>
        <th>교과목명</th>
        <th>교과구분</th>
        <th>교수</th>
        <th>학점</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="offerList" items="${offerList}" varStatus="status">
        <tr>
            <td class="oc-tbody-td"><c:out value="${status.index+1}" /></td>
            <td class="oc-tbody-td"><c:out value="${offerList.year}" /></td>
            <td class="oc-tbody-td"><c:out value="${offerList.semester}" /></td>
            <td class="oc-tbody-td" onclick="deleteOffer('<c:out value="${offerList.courseCode}" />')">
                <c:out value="${offerList.courseCode}" />
            </td>
            <td class="oc-tbody-td"><c:out value="${offerList.courseName}" /></td>
            <td class="oc-tbody-td"><c:out value="${offerList.courseType}" /></td>
            <td class="oc-tbody-td"><c:out value="${offerList.professor}" /></td>
            <td class="oc-tbody-td"><c:out value="${offerList.credit}" /></td>
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

    function deleteOffer(courseCode) {
        if (confirm("삭제하시겠습니까?")) {
            window.location.href = "${pageContext.request.contextPath}/delete?courseCode=" + courseCode;
        }
    }
</script>
</html>
