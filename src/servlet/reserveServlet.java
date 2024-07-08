package servlet;

import Dao.Daoimpl.IOrderSeatImpl;
import DaoFactory.DaoFactory;
import Service.Impl.IOrderSeatServiceImpl;
import ServiceFactory.ServiceFactory;
import VO.Seat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(
        urlPatterns = "/reserveServlet"
)
public class reserveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String SignIn = (String) session.getAttribute("signin");
        if(SignIn==null || SignIn.equals("false")){
            resp.sendRedirect("page/sign_up.jsp");
            return;
        }
        IOrderSeatServiceImpl OrderSeatServiceImpl =  ServiceFactory.CreateIOrderSeatServiceImpl();

        req.setAttribute("Datelist", OrderSeatServiceImpl.CalculateDateList());

        req.setAttribute("ReservationList", OrderSeatServiceImpl.SearchReservationList());

        req.setAttribute("SeatList", OrderSeatServiceImpl.SearchAllSeat());

        req.getRequestDispatcher("page/reserve.jsp").forward(req, resp);

    }
}
