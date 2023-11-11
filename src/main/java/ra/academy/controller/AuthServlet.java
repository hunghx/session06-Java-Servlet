package ra.academy.controller;

import ra.academy.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "AuthServlet", value = "/AuthServlet")
public class AuthServlet extends HttpServlet {
    private List<User> userList;

    @Override
    public void init() throws ServletException {
        userList = new ArrayList<>();
        userList.add(new User("hunghx","123456","Hồ Xuân Hùng"));
        userList.add(new User("namtx","123456","Trần Xuân Nam"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action){
                case "LOGIN":
                    request.getRequestDispatcher("/WEB-INF/form-login.jsp").forward(request,response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action){
                case "LOGIN":
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    Optional<User> optionalUser = userList.stream()
                            .filter(u->u.getUsername().equalsIgnoreCase(username)&&u.getPassword().equalsIgnoreCase(password))
                            .findFirst();
                    if (optionalUser.isPresent()){
                        request.setAttribute("userlogin",optionalUser.get());
                        request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request,response);
                    }else {
                        request.setAttribute("username",username);
                        request.setAttribute("password",password);
                        request.setAttribute("error_login","Tên đănng nhập hoặc mật khẩu không đúng");
                        request.getRequestDispatcher("/WEB-INF/form-login.jsp").forward(request,response);
                    }
                    break;
            }
        }
    }
}