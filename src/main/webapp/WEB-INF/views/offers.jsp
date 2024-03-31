<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강신청 조회</title>
</head>
<body>
<table border="1">
    <thead>
    <tr>
        <th>id</th>
        <th>Username</th>
        <th>Email</th>
        <th>Password</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="offer" items="${id_offers}" >
        <tr>
            <td><c:out value="${offer.id}" /></td>
            <td><c:out value="${offer.username}" /></td>
            <td><c:out value="${offer.email}" /></td>
            <td><c:out value="${offer.password}" /></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
