package servlet;

import DaoFactory.DaoFactory;
import ServiceFactory.ServiceFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        urlPatterns = "/deleteFromCategoryServlet"
)
public class deleteFromCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String ID = req.getParameter("ID");
        ServiceFactory.CreateIDishServiceImpl().DeleteFromCategory(ID, type);
        resp.sendRedirect("adminServlet");
    }
}
