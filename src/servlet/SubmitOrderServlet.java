package servlet;

import Dao.Daoimpl.IOrderItemImpl;
import DaoFactory.DaoFactory;
import Service.Impl.IDishServiceImpl;
import Service.Impl.IOrderServiceImpl;
import ServiceFactory.ServiceFactory;
import VO.Order;
import VO.OrderItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(
        urlPatterns = "/SubmitOrderServlet"
)
public class SubmitOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double sumprice = Double.valueOf(req.getParameter("sumprice"));
        double dishnum = Double.valueOf(req.getParameter("dishnum"));
        List<Integer> dishids = new ArrayList<Integer>();
        for(int i= 0 ; i < dishnum ; i++) {
            String dish = req.getParameter("dishid["+i+"]");
            if(dish != null){
                dishids.add(Integer.valueOf(dish));
            }
        }
        List<Integer> thisdishnum = new ArrayList<Integer>();
        for(int i= 0 ; i<dishnum;i++){
            String num = req.getParameter("thisdishnum["+i+"]");
            if(num != null){
                thisdishnum.add(Integer.valueOf(num));
            }
        }

        IOrderServiceImpl OrderServiceImpl= ServiceFactory.CreateIOrderServiceImpl();
        //建立订单

        String User = (String) req.getSession().getAttribute("UserName");
        Order order = OrderServiceImpl.createOrder(User,sumprice);
        req.setAttribute("order", order);

        //关联订单菜品
        req.setAttribute("dishes",OrderServiceImpl.CreatOrderItems(order,dishids,thisdishnum));


        req.getRequestDispatcher("page/Checkout.jsp").forward(req, resp);
    }
}
