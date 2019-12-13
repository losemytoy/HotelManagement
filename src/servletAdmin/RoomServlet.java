package servletAdmin;

import pojoAdmin.Room;
import serviceAdmin.RoomService;
import serviceAdmin.impl.RoomServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class RoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Room room = new Room();
        String method = req.getParameter("method");
        if(method == null){
            method = "1";
        }
        switch (method){
            case "1":
                listRoom(req, resp);
                break;
            case "2":
                findRoom(req, resp);
                break;
            case "3":
                updateCustomer(req, resp);
                break;
            case "4":
                deleteRoom(req, resp);
                break;
            case "5":
                addRoom(req, resp);
                break;
            case "6":
                searchRoom(req, resp);
                break;

        }
    }

    private void listRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
        RoomService roomService = new RoomServiceImpl();
        List<Room> rooms = roomService.getAllRoom();
        RequestDispatcher dispatcher = req.getRequestDispatcher("RoomListAdmin.jsp");
        req.setAttribute("room", rooms);
        dispatcher.forward(req,resp);
    }

    private void findRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RoomService roomService=new RoomServiceImpl();
        String id=req.getParameter("roomId");
        Room room = roomService.queryRoom(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("ModityRoom.jsp");
        req.setAttribute("room",room);
        dispatcher.forward(req,resp);
    }

    private void updateCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=req.getParameter("roomid");
        String stat = req.getParameter("roomstat");
        if (id != null){
            Room room = new Room();
            room.setRoom_id(id);
            room.setRoom_stat(stat);
            room.setRoom_price((formatStr(req.getParameter("roomprice"))));
            RoomService roomService = new RoomServiceImpl();
            roomService.updateRoom(room);
        }
        listRoom(req,resp);
    }

    private void deleteRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
        String id = req.getParameter("roomId");
        RoomService roomService = new RoomServiceImpl();
        if (roomService.deleteRoom(id)) {
            req.setAttribute("result", "<script language'javascript'>alert('删除成功');</script>");
        } else {
            req.setAttribute("result", "<script language'javascript'>alert('删除失败');</script>");
        }
        listRoom(req, resp);
    }

    private void addRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomId=req.getParameter("roomid");
        if (roomId != null) {
            String roomstat = req.getParameter("roomstat");
            String roomprice = req.getParameter("roomprice");
            Room room=new Room();
            room.setRoom_id(roomId);
            room.setRoom_stat(roomstat);
            room.setRoom_price(roomprice);
            RoomService roomService=new RoomServiceImpl();
            String result;
            if(roomService.insertRoom(room)){
                result="成功添加";
            }else {
                result = "添加失败";
            }
            req.setAttribute("result",result);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("addUserNumber.jsp");
        dispatcher.forward(req, resp);
    }

    private void searchRoom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RoomService roomService=new RoomServiceImpl();
        String id=req.getParameter("roomid");
        Room room = roomService.queryRoom(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("SearchRoomList.jsp");
        req.setAttribute("room",room);
        dispatcher.forward(req,resp);
    }

    private String formatStr(String string){
        return string==null?"":string;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
