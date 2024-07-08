package servlet;

import Dao.Daoimpl.IDishImpl;
import DaoFactory.DaoFactory;
import Service.IDishService;
import Service.Impl.IDishServiceImpl;
import ServiceFactory.ServiceFactory;
import VO.Dish;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(
        urlPatterns = "/OrderingMealsServlet"
)
public class OrderingMealsServlet extends HttpServlet {

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
        IDishServiceImpl DishService = ServiceFactory.CreateIDishServiceImpl();

        req.setAttribute("NewProductsOfTheSeason", DishService.SearchByCategory("NewProductsOfTheSeason"));

        req.setAttribute("ChefRecommendation", DishService.SearchByCategory("ChefRecommendation"));

        req.setAttribute("PopularSigns",DishService.SearchByCategory("PopularSigns"));

        req.setAttribute("Vegetarianism",DishService.SearchByCategory("Vegetarianism"));

        req.setAttribute("AluminiumicBeverages",DishService.SearchByCategory("AluminiumicBeverages"));


        req.getRequestDispatcher("/page/Ordering-meals.jsp").forward(req,resp);
    }
}
