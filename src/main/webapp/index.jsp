<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--điều hướng trang tự động--%>
<%
  // điều hướng theo đường dẫn
//  response.sendRedirect("/WEB-INF/about.jsp");
  // chuyển tiếp yêu cầu
  request.setAttribute("name","Hồ Xuân Hùng");
  request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request,response);
%>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <jsp:include page="view/assets/head.jsp"></jsp:include>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a class="text-danger text-xl" href="hello-servlet">Hello Servlet</a>

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

<a href="/home">Home</a>
<jsp:include page="view/assets/foot.jsp"></jsp:include>

<%-- tạo tính năng đăng nhập
B1 : trang chủ bấm vào nút đăng nhập -> form đăng nhập
b2: nhập thông tin đăng nhập -> servlet AuthServlet
b3: nếu sai thông tin -- hiện thị lỗi và thực hiện lại b2
b4: nếu đúng trả về lời chào ở trang home và ẩn nút login đi

--%>
</body>
</html>