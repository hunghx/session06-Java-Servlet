package ra.academy.controller;

import ra.academy.model.Todo;
import ra.academy.service.TodoService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "TodoServlet", value = "/TodoServlet")
public class TodoServlet extends HttpServlet {
    private TodoService todoService;

    @Override
    public void init() throws ServletException {
        todoService = new TodoService();
        Todo t1 = new Todo(todoService.getNewId(), "Đi học", true);
        Todo t2 = new Todo(todoService.getNewId(), "Đi ngủ", false);
        todoService.save(t1);
        todoService.save(t2);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "GETALL":
                    showListTodo(response);
                    break;
                case "DELETE":
                    int id = Integer.parseInt(request.getParameter("id"));
                    todoService.deleteById(id);
                    showListTodo(response);
                case "ADD":
                    addTodo(response);
                    break;


            }
        }
    }

    protected void showListTodo(HttpServletResponse response) throws IOException {
        // lấy danh sách công việc
        List<Todo> list = todoService.findAll();
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Title</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h1>Danh sách công việc</h1>\n" +
                "<a href=\"/TodoServlet?action=ADD\">Thêm mới</a>\n" +
                "<table border=\"1\" cellspacing=\"10\" cellpadding=\"20\">\n" +
                "    <tr>\n" +
                "        <th>ID</th>\n" +
                "        <th>TASK</th>\n" +
                "        <th>STATUS</th>\n" +
                "        <th colspan=\"2\">ACTION</th>\n" +
                "    </tr>\n");
        for (Todo t:list
             ){
            out.println("    <tr>\n" +
                    "        <td>"+t.getId()+"</td>\n" +
                    "        <td>"+t.getTask()+"</td>\n" +
                    "        <td>"+(t.isStatus()?"Hoàn thành":"Chưa hoàn thành")+"</td>\n" +
                    "        <td><a href=\"/TodoServlet?action=EDIT&id="+t.getId()+"\">Edit</a></td>\n" +
                    "        <td><a href=\"/TodoServlet?action=DELETE&id="+t.getId()+"\" onclick=\"return confirm('Bạn có chắc chắn muốn xóa không?')\">Delete</a></td>\n" +
                    "    </tr>\n");
        }


        out.println("</table>\n" +
                "</body>\n" +
                "</html>");
    }
    protected void addTodo(HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>Title</title>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h1>Thêm mới</h1>\n" +
                "<form action=\"/TodoServlet\" method=\"post\">\n" +
                "    <textarea placeholder=\"nội dung công việc\" name=\"task\"></textarea>\n" +
                "    <select name=\"status\">\n" +
                "        <option value=\"true\">Hoàn thành</option>\n" +
                "        <option value=\"false\" selected>Chưa hoàn thành</option>\n" +
                "    </select>\n" +
                "    <input type=\"submit\" value=\"ADD\" name=\"action\">\n" +
                "</form>\n" +
                "</body>\n" +
                "</html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "ADD":
                    String task = request.getParameter("task");
                    boolean status = Boolean.parseBoolean(request.getParameter("status"));
                    Todo newTodo= new Todo(todoService.getNewId(),task,status);
                    todoService.save(newTodo);
                    showListTodo(response);
                    break;
            }
        }
    }
}