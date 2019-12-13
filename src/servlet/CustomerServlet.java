package servlet;

import pojo.Customer;
import service.CustomerService;
import service.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(urlPatterns = "/cus.do")
public class CustomerServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if (method == null){
            method = "1";
        }
        switch (method){
            case "1":
                listCus(req, resp);
                break;
            case "2":
                findCustomer(req, resp);
                break;
            case "3":
                updateCustomer(req, resp);
                break;

        }
    }



    private void findCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerService service=new CustomerServiceImpl();
        String id=req.getParameter("account");
        Customer customer = service.queryCustomer(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("modity.jsp");
        req.setAttribute("customer",customer);
        dispatcher.forward(req,resp);
    }

    private String formatStr(String string){
        return string==null?"":string;
    }


    private void updateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("useraccount");
        String cusname = req.getParameter("username");
        if (cusname != null){
            Customer customer = new Customer();
            customer.setUser_account(id);
            customer.setUser_name(cusname);
            customer.setUser_sex(formatStr(req.getParameter("usersex")));
            customer.setUser_age(formatStr(req.getParameter("userage")));
            customer.setUser_sfz(formatStr(req.getParameter("usersfz")));
            customer.setUser_tel(formatStr(req.getParameter("usertel")));
            CustomerService customerService = new CustomerServiceImpl();
            customerService.updateCustomer(customer);
        }
        listCus(req,resp);
    }

    private void listCus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerService customerService = new CustomerServiceImpl();
        List<Customer> customers = customerService.getAllCustomer();
        RequestDispatcher dispatcher = req.getRequestDispatcher("CustomerList.jsp");
        req.setAttribute("customer", customers);
        dispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
