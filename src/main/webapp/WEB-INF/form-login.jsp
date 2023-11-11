<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 11/11/2023
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <jsp:include page="../view/assets/head.jsp"></jsp:include>
</head>
<body>
<h1>Login</h1>
<form action="/AuthServlet" method="post">
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Username</label>
        <input type="text" value="${username}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username">

    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" value="${password}" class="form-control" id="exampleInputPassword1" name="password">
    </div>

    <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1">
        <label class="form-check-label" for="exampleCheck1">Check me out</label>
    </div>
    <c:if test="${error_login!=null}">
        <div id="emailHelp" class="form-text text-danger">${error_login}</div>
    </c:if>
    <input type="submit" class="btn btn-primary" name="action" value="LOGIN">
</form>


<jsp:include page="../view/assets/foot.jsp"></jsp:include>

</body>
</html>
