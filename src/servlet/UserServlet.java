package servlet;

import pojo.Customer;
import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(urlPatterns = "/user.do")
public class UserServlet extends HttpServlet {

    private String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int method = Integer.parseInt(req.getParameter("method"));
        switch (method){
            case 1:
                UserSignIn(req,resp);
                break;
            case 2:
                signUp(req, resp);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void UserSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        User user = new User();
        user.setUser_account(req.getParameter("user_account"));
        user.setUser_pwd(req.getParameter("user_pwd"));
        UserService userService = new UserServiceImpl();
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        if(userService.UserSignIn(user,session)){
            out.print("<script language=javascript>alert('登陆成功!');window.location.href='shouye.jsp';</script>");
        }else{
            out.print("<script language=javascript>alert('登陆失败!');history.go(-1);</script>");
        }
    }

    private void signUp(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Customer customer=new Customer();
        customer.setUser_account(formatStr(req.getParameter("id")));
        customer.setUser_pwd(formatStr(req.getParameter("pwd")));

        UserService userService = new UserServiceImpl();
        if (userService.signUp(customer)) {
            req.setAttribute("result", "<script language=javascript>alert('成功注册，请尽快完善资料！');</script>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("log_in.jsp");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("result", "<script language=javascript>alert('注册失败！');</script>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("register.jsp");
            dispatcher.forward(req, resp);
        }

    }
}
