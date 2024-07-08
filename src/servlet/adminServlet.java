package servlet;

import Dao.Daoimpl.*;
import DaoFactory.DaoFactory;
import Service.IOrderSeatService;
import Service.Impl.IChartServiceImpl;
import Service.Impl.IDishServiceImpl;
import Service.Impl.IOrderServiceImpl;
import ServiceFactory.ServiceFactory;
import VO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(
        urlPatterns = "/adminServlet"
)
public class adminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mod = req.getParameter("mod");
        //管理所有菜品
        if(mod==null || mod.equals("managedishes")){
            String CurPage = req.getParameter("CurPage");
            IDishServiceImpl DishService = ServiceFactory.CreateIDishServiceImpl();

            if(CurPage==null){
                CurPage = "1";
            }
            req.setAttribute("CurPage",Integer.valueOf(CurPage));//当前页

            int TotalPages = DishService.AllTotalPages(CurPage);
            req.setAttribute("TotalPages",TotalPages);//总页数

            //返回各类菜品
            req.setAttribute("Alldishes",DishService.SearchAllByPage(CurPage));
            req.setAttribute("NewProductsOfTheSeason",DishService.SearchByCategory("NewProductsOfTheSeason"));
            req.setAttribute("PopularSigns",DishService.SearchByCategory("PopularSigns"));
            req.setAttribute("ChefRecommendation",DishService.SearchByCategory("ChefRecommendation"));
            req.setAttribute("Vegetarianism",DishService.SearchByCategory("Vegetarianism"));
            req.setAttribute("AluminiumicBeverages",DishService.SearchByCategory("AluminiumicBeverages"));
            req.setAttribute("mod","managedishes");
            req.getRequestDispatcher("admin/admin.jsp").forward(req,resp);

        }
        //管理订单
        else if(mod.equals("manageOrder")){
            int PageLength = 10;
            String CurPage = req.getParameter("CurPage");
            IOrderServiceImpl OrderService = ServiceFactory.CreateIOrderServiceImpl();
            if(CurPage==null)
                CurPage = "1";
            req.setAttribute("CurPage",Integer.valueOf(CurPage));//返回当前页

            req.setAttribute("TotalPages",OrderService.OrderTotalPages(CurPage));//返回总页数

            req.setAttribute("OrderList",OrderService.SearchOrderByPage(CurPage));
            req.setAttribute("mod","manageOrder");
            req.getRequestDispatcher("admin/admin.jsp?mod=manageOrder").forward(req,resp);
        }
        //管理订单项目
        else if(mod.equals("manageOrderItem")) {
            req.setAttribute("mod","manageOrderItem");//返回模式
            String OrderID = req.getParameter("OrderID");
            req.setAttribute("OrderID",OrderID);//返回订单id

            req.setAttribute("OrderItemList",ServiceFactory.CreateIOrderServiceImpl().SearchOrderItemByID(OrderID));
            req.getRequestDispatcher("admin/admin.jsp").forward(req,resp);
        }
        //管理座位订单
        else if(mod.equals("manageSeatOrder")){
            req.setAttribute("mod","manageSeatOrder");
            IOrderSeatService OrderSeatService = ServiceFactory.CreateIOrderSeatServiceImpl();

            String CurPage = req.getParameter("CurPage");
            if(CurPage==null)
                CurPage = "1";
            req.setAttribute("CurPage",Integer.valueOf(CurPage));//返回当前页


            req.setAttribute("TotalPages",OrderSeatService.TotalPages());//返回总页数

            req.setAttribute("OrderSeatList",OrderSeatService.SearchOrderSeatByPage(CurPage));//返回列表
            req.getRequestDispatcher("admin/admin.jsp").forward(req,resp);

        }
        //管理轮播图
        else if(mod.equals("manageChart")){
            req.setAttribute("mod","manageChart");
            IChartServiceImpl ChartService = ServiceFactory.CreateIChartServiceImpl();
            req.setAttribute("ChartList",ChartService.SearchAllCharts());
            req.getRequestDispatcher("admin/admin.jsp").forward(req,resp);
        }
    }
}
