<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: nykim--%>
<%--  Date: 2024-03-11--%>
<%--  Time: 오후 2:38--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" type="text/css"--%>
<%--          href="${pageContext.request.contextPath}/resources/css/main.css" >--%>

<%--</head>--%>
<%--<body>--%>
<%--<sf:form method="post" action="${pageContext.request.contextPath}/docreate" modelAttribute="offer">--%>
<%--    <table class="formtable">--%>
<%--        <tr>--%>
<%--            <td>교수님 성함</td>--%>
<%--            <td><input type="text"/> </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><input type="submit" value="새 제안"/> </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</sf:form>--%>
<%--</body>--%>
<%--</html>--%>
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
    <title>수강신청 하기</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/main.css" >

</head>
<body>
<p> <a href="${pageContext.request.contextPath}/"> 학사 정보 시스템 </a></p>
<sf:form method="post" action="${pageContext.request.contextPath}/check" modelAttribute="offer">
    <table class="formtable">
        <tr>
            <td class="label"> 년도:</td>
            <td><sf:input class="control" type="text" path="year"/>  <br/>
                <sf:errors path="year" class="error"/>
            </td>
        </tr>
        <tr>
            <td class="label"> 학기:</td>
            <td><sf:input class="control" type="text" path="semester"/> <br/>
                <sf:errors path="semester" class="error" />
            </td>
        </tr>
        <tr>
            <td class="label"> 교과코드:</td>
            <td><sf:input class="control" type="text" path="courseCode"/> <br/>
                <sf:errors path="courseCode" class="error" />
            </td>
        </tr>
        <tr>
            <td class="label"> 교과목명:</td>
            <td><sf:input class="control" type="text" path="courseName"/>  <br/>
                <sf:errors path="courseName" class="error"/>
            </td>
        </tr>
        <tr>
            <td class="label"> 교과구분:</td>
            <td><sf:input class="control" type="text" path="courseType"/>  <br/>
                <sf:errors path="courseType" class="error"/>
            </td>
        </tr>
        <tr>
            <td class="label"> 담당교수:</td>
            <td><sf:input class="control" type="text" path="professor"/>  <br/>
                <sf:errors path="professor" class="error"/>
            </td>
        </tr>
        <tr>
            <td class="label"> 학점:</td>
            <td><sf:input class="control" type="text" path="credit"/>  <br/>
                <sf:errors path="credit" class="error"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="수강신청 하기"/> </td>
        </tr>
    </table>
</sf:form>
</body>
</html>
