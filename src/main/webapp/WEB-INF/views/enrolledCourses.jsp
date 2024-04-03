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
        <th>년도</th>
        <th>학기</th>
        <th>교과코드</th>
        <th>교과목명</th>
        <th>교과구분</th>
        <th>담당교수</th>
        <th>학점</th>
    </tr>
    </thead>
    <tbody>
<%--        <tr>--%>
<%--            <td>${offerList.year}</td>--%>
<%--            <td>${offerList.semester}</td>--%>
<%--            <td>${offerList.courseCode}</td>--%>
<%--            <td>${offerList.courseName}</td>--%>
<%--            <td>${offerList.courseType}</td>--%>
<%--            <td>${offerList.professor}</td>--%>
<%--            <td>${offerList.credit}</td>--%>
<%--        </tr>--%>
<c:forEach var="offerList" items="${offerList}">
    <tr>
        <td><c:out value="${offerList.year}" /></td>
        <td><c:out value="${offerList.semester}" /></td>
        <td><c:out value="${offerList.courseCode}" /></td>
        <td><c:out value="${offerList.courseName}" /></td>
        <td><c:out value="${offerList.courseType}" /></td>
        <td><c:out value="${offerList.professor}" /></td>
        <td><c:out value="${offerList.credit}" /></td>

<%--        <td>${offerList.courseCode}</td>--%>
<%--        <td>${offerList.courseName}</td>--%>
<%--        <td>${offerList.courseType}</td>--%>
<%--        <td>${offerList.professor}</td>--%>
<%--        <td>${offerList.credit}</td>--%>
    </tr>
</c:forEach>
    </tbody>
</table>
</body>
</html>
