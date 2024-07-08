package servlet;

import ServiceFactory.ServiceFactory;
import VO.Dish;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet(
        urlPatterns = "/adddishServlet"
)
@MultipartConfig
public class adddishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Part filePart = req.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        Dish dish = new Dish();
        dish.setDishImgUrl(fileName);
        dish.setDishName(req.getParameter("name"));
        dish.setDishDescription(req.getParameter("description"));
        String price = req.getParameter("price");
        dish.setPrice(Double.valueOf(price));

        ServiceFactory.CreateIDishServiceImpl().addDish(filePart, dish);

        resp.sendRedirect("adminServlet");
    }
}
