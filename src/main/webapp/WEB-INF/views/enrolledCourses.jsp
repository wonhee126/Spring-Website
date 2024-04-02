<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>학년별 이수 학점 조회</title>
</head>
<body>
<table border="1">
    <thead>
    <tr>
        <%--        <th>user_id</th>--%>
        <th>년도</th>
        <th>학기</th>
        <%--        <th>교과코드</th>--%>
                <th>교과목명</th>
                <th>교과구분</th>
            <th>담당교수</th>
        <th>학점</th>

<%--        <th>상세보기</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="offer" items="${offer}" >
        <tr>
                <%--            <td><c:out value="${offer.user_id}" /></td>--%>
            <td>${offer.year}</td>
            <td>${offer.semester}</td>
            <td>${offer.courseName}</td>
            <td>${offer.courseType}</td>
            <td>${offer.professor}</td>
            <td>${offer.credit}</td>
<%--            <td><a href="${pageContext.request.contextPath}/docreate"> 상세보기  </a></td>--%>

                <%--            <td><c:out value="${offer.courseCode}" /></td>--%>
                <%--            <td><c:out value="${offer.courseName}" /></td>--%>
                <%--            <td><c:out value="${offer.courseType}" /></td>--%>
                <%--            <td><c:out value="${offer.professor}" /></td>--%>
                <%--            <td><c:out value="${offer.credit}" /></td>--%>

                <%--            <td><c:out value="${offer.username}" /></td>--%>
                <%--            <td><c:out value="${offer.email}" /></td>--%>
                <%--            <td><c:out value="${offer.password}" /></td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
