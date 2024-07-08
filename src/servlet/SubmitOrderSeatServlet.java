package servlet;

import DaoFactory.DaoFactory;
import ServiceFactory.ServiceFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbutils.QueryRunner;
import util.DataSourceUtils;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        urlPatterns = "/SubmitOrderSeatServlet"
)
public class SubmitOrderSeatServlet extends HttpServlet {
    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Date = req.getParameter("date");
        String SeatID = req.getParameter("roomid");
        String ReservePhone = req.getParameter("phone");
        String ReserveName = req.getParameter("name");
        String UserName = (String) req.getSession().getAttribute("UserName");

        ServiceFactory.CreateIOrderSeatServiceImpl().SubmitOrderSeat(Date,UserName,SeatID,ReservePhone,ReserveName);

        resp.sendRedirect("reserveServlet");
    }
}
