<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2024-03-11
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/main.css" >

</head>
<body>
<sf:form method="post" action="${pageContext.request.contextPath}/docreate" modelAttribute="offer">
    <table class="formtable">
        <tr>
            <td>교수님 성함</td>
            <td><input type="text"/> </td>
        </tr>
        <tr>
            <td><input type="submit" value="새 제안"/> </td>
        </tr>
    </table>
</sf:form>
</body>
</html>
