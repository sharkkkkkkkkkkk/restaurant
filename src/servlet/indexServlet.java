package servlet;

import DaoFactory.DaoFactory;
import ServiceFactory.ServiceFactory;
import VO.CarouselChart;
import VO.Dish;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(
        urlPatterns = "/indexServlet"
)
public class indexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("DishList", ServiceFactory.CreateIDishServiceImpl().SearchByCategory("PopularSigns"));

        req.setAttribute("ChartList",ServiceFactory.CreateIChartServiceImpl().SearchAllCharts());

        req.getRequestDispatcher("page/index.jsp").forward(req, resp);

    }
}
