package servlet;

import ServiceFactory.ServiceFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(
        urlPatterns = "/addCategoryServlet"
)
public class addCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type = Integer.valueOf(req.getParameter("type"));
        int ID = Integer.valueOf(req.getParameter("ID"));
        int CurPage = Integer.valueOf(req.getParameter("CurPage"));
        ServiceFactory.CreateIDishServiceImpl().addCategory(type, ID);
        resp.sendRedirect("adminServlet?mod=managedishes&CurPage="+CurPage);
    }
}

