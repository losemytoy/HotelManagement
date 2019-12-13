package servlet;

import pojo.Order;
import service.OrderService;
import service.impl.OrderServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(urlPatterns = "/add.do")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method1");
        if (method == null){
            method = "1";
        }
        switch (method){
            case "1":
                listOrd(req, resp);
                break;
            case "2":
                findOrder(req, resp);
                break;
            case "3":
                updateOrder(req, resp);
                break;
            case "4":
                deleteOrder(req, resp);
                break;
            case "5":
                addOrder(req, resp);
                break;
            default:
        }
    }



    private void findOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService service=new OrderServiceImpl();
        String id=req.getParameter("account");
        Order order = service.queryOrder(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("modity.jsp");
        req.setAttribute("order",order);
        dispatcher.forward(req,resp);
    }

    private String formatStr(String string){
        return string==null?"":string;
    }


    private void updateOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("order_id");
        if (id != null){
            Order order = new Order();
            order.setOrder_id(id);
            order.setUser_account(formatStr(req.getParameter("usersex")));
            order.setRoom_id(formatStr(req.getParameter("userage")));
            OrderService orderService = new OrderServiceImpl();
            orderService.updateOrder(order);
        }
        listOrd(req,resp);
    }

    private void listOrd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = new OrderServiceImpl();
        List<Order> order = orderService.getAllOrder();
        RequestDispatcher dispatcher = req.getRequestDispatcher("OrderList.jsp");
        req.setAttribute("order", order);
        dispatcher.forward(req, resp);
    }

    private void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String id = req.getParameter("account");
        OrderService orderService = new OrderServiceImpl();
        if (orderService.deleteOrder(id)) {
            req.setAttribute("result", "<script language'javascript'>alert('删除成功');</script>");
        } else {
            req.setAttribute("result", "<script language'javascript'>alert('删除失败');</script>");
        }
        listOrd(req, resp);
    }


    private void addOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order=new Order();
        order.setOrder_id(formatStr(req.getParameter("order_id")));
        order.setUser_account(formatStr(req.getParameter("user_account")));
        order.setRoom_id(formatStr(req.getParameter("room_id")));

        OrderService orderService=new OrderServiceImpl();
        if (orderService.insertOrder(order)) {
            req.setAttribute("result", "<script language=javascript>alert('订房成功！');</script>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("OrderList.jsp");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("result", "<script language=javascript>alert('订房失败！');</script>");
            RequestDispatcher dispatcher = req.getRequestDispatcher("RoomList.jsp");
            dispatcher.forward(req, resp);
        }

    }

    private void gotoaddOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Order order=new Order();
        String room_id = req.getParameter("id");
        order.setRoom_id(room_id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("addOrder.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
