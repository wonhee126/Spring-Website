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
        <th>수강년도</th>
        <th>학기</th>
        <th>취득 학점</th>
        <th>상세보기</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="year_semester_map" value="${year_semester_map}" />
    <c:set var="totalCredits" value="0" />
    <c:forEach var="year" items="${year_semester_map}">
        <c:forEach var="semester_entry" items="${year.value}">
            <tr>
                <td><c:out value="${year.key}" /></td>
                <td><c:out value="${semester_entry.key}" /></td>
                <td><c:out value="${semester_entry.value}" /></td>
                <td><a href="${pageContext.request.contextPath}/docreate?year=${year.key}&semester=${semester_entry.key}"> 상세보기  </a></td>
                <c:set var="totalCredits" value="${totalCredits + semester_entry.value}" />
            </tr>
        </c:forEach>
    </c:forEach>
    <tr>
        <td colspan="2">총계</td>
        <td><c:out value="${totalCredits}" /></td>
        <td></td>
    </tr>
    </tbody>
</table>
</body>
</html>
