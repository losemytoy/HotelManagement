package servletAdmin;

import pojoAdmin.Admin;
import serviceAdmin.AdminService;
import serviceAdmin.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(urlPatterns = "/admin.do")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int method = Integer.parseInt(req.getParameter("method"));
        switch (method){
            case 1:
                AdminSignIn(req,resp);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void AdminSignIn(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        Admin admin = new Admin();
        admin.setAdmin_account(req.getParameter("admin_account"));
        String account = req.getParameter("admin_account");
        req.getSession().setAttribute("admin_account",account);
        admin.setAdmin_pwd(req.getParameter("admin_pwd"));
        AdminService adminService = new AdminServiceImpl();
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        if(adminService.AdminSignIn(admin,session)){
            out.print("<script language=javascript>alert('登陆成功!');window.location.href='AdminIndexAdmin.jsp';</script>");
        }else{
            out.print("<script language=javascript>alert('登陆失败!');history.go(-1);</script>");
        }
    }
}
