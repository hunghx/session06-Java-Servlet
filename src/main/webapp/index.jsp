<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>

<form action="/StudentServlet" method="get">
  <div>
    <label for="name">Tên</label>
    <input type="text" name="name" id="name">
  </div>
  <div>
    <label for="age">Tuổi</label>
    <input type="number" min="10" max="100" name="age" id="age">
  </div>
<%--  <button type="submit"></button>--%>
  <input type="submit" value="Send">
</form>


<a href="/StudentServlet?id=5&name=hung&action=add">Gửi ID = 5</a>
<a href="/StudentServlet?action=ADD">Thêm mới</a>
<a href="/time-servlet">Get Time</a>
<a href="/TodoServlet?action=GETALL">Quản lý công việc</a>
</body>
</html>