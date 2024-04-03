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
    <title>상세보기 페이지</title>
</head>
<body>
<h2>${year}년 ${semester}학기 상세보기</h2>
<table border="1">
    <thead>
    <tr>
        <th>수강년도</th>
        <th>학기</th>
        <th>교과코드</th>
        <th>교과명</th>
        <th>교과구분</th>
        <th>교수</th>
        <th>학점</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td><c:out value="${offer.year}" /></td>
            <td><c:out value="${offer.semester}" /></td>
            <td><c:out value="${offer.courseCode}" /></td>
            <td><c:out value="${offer.courseName}" /></td>
            <td><c:out value="${offer.courseType}" /></td>
            <td><c:out value="${offer.professor}" /></td>
            <td><c:out value="${offer.credit}" /></td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
</html>

