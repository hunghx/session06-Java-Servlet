<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="ra.academy.model.Todo" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 11/11/2023
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    List<Todo>  list ;
%>

<%!
    public  void jspInit(){
        System.out.println("Khởi tạo các giá trị");
        list = Arrays.asList(
                new Todo(1,"quét nhà",true),new Todo(2,"rửa bát",false)
        );
    }
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="nav nav-pills flex-column flex-sm-row">
   <c:if test="${userlogin!=null}">
       <p>Chào mừng  ${userlogin.fullName} đến với trang web</p>
   </c:if>
    <c:if test="${userlogin==null}">
        <a class="flex-sm-fill text-sm-center nav-link active" aria-current="page" href="/AuthServlet?action=LOGIN">Login</a>
    </c:if>
    <a class="flex-sm-fill text-sm-center nav-link" href="#">Longer nav link</a>
    <a class="flex-sm-fill text-sm-center nav-link" href="#">Link</a>
    <a class="flex-sm-fill text-sm-center nav-link disabled" aria-disabled="true">Disabled</a>
</nav>
<h1>Hello world again!!! , I Am ${name}</h1>
<c:set var="age" value="100" scope="page"></c:set>
<table>
    <tr>
        <th>index</th>
        <th>STT</th>
        <th>ID</th>
        <th>Task</th>
        <th>Status</th>
    </tr>
    <c:forEach items="<%=list%>" var="todo" varStatus="loop">
        <tr>
            <td>${loop.index}</td>
            <td>${loop.count}</td>
            <td>${loop.current.id}</td>
            <td>${loop.current.task}</td>
            <td>${loop.current.status?"Hoàn thành":"Chưa hoàn thành"}</td>
        </tr>
    </c:forEach>


    <div>
        <c:forEach begin="1" end="10" varStatus="loop">
            <a href="${loop.count}">${loop.count}</a>
        </c:forEach>
    </div>
<%--    <%--%>
<%--        for (Todo t:list) {--%>
<%--            System.out.println(t);--%>
<%--        }--%>
<%--    %>--%>
</table>
<p>Tuôir của tôi là : ${age}</p>

<c:if test="${age>50}">
    <p>Trung niên</p>
</c:if>
<c:if test="${age<=50}">
    <p>chua trung niên</p>
</c:if>

<c:choose>
    <c:when test="${age<20 && age<30}">
        <p>Vị thành niên</p>
    </c:when>
    <c:when test="${age<50}">
        <p>Dưới trung niên</p>
    </c:when>
    <c:otherwise>
        <p>Trung niên</p>
    </c:otherwise>
</c:choose>

</body>
</html>

<%!
    public  void jspDestroy(){
        System.out.println("hủy jsp");
    }
%>
