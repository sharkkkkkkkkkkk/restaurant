package Service.Impl;

import Dao.Daoimpl.IOrderImpl;
import Dao.Daoimpl.IOrderItemImpl;
import DaoFactory.DaoFactory;
import Service.IOrderService;
import VO.Order;
import VO.OrderItem;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IOrderServiceImpl implements IOrderService {
    @Override
    public int OrderTotalPages(String CurPage) {
        int PageLength = 10;
        IOrderImpl OrderRunner = DaoFactory.CreateIOrderImpl();
        List<Order> AllOrderList;

        try {
            AllOrderList = OrderRunner.SearchAllOrder();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int TotalPages = AllOrderList.size()/PageLength;
        if(AllOrderList.size()%PageLength!=0) TotalPages++;
        return TotalPages;
    }
    @Override
    public List<Order> SearchOrderByPage(String CurPage) {
        IOrderImpl OrderRunner = DaoFactory.CreateIOrderImpl();
        List<Order> OrderList;

        try {
            OrderList = OrderRunner.SearchAllOrder();
            OrderList = OrderRunner.SearchAllByPage(Integer.valueOf(CurPage),10,OrderList.size());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return OrderList;
    }

    @Override
    public List<OrderItem> SearchOrderItemByID(String OrderID) {
        List<OrderItem> OrderItemList;
        try {
            OrderItemList = DaoFactory.CreateIOrderItemImpl().SearchOrderItemsByOrderID(OrderID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return OrderItemList;
    }

    @Override
    public void DeleteItemByOrderIDDishID(String OrderID, String DishID) {
        try {
            DaoFactory.CreateIOrderItemImpl().DeleteItemByOrderIDDishID(OrderID, DishID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void DeleteOrder(String OrderID) {
        try {
            DaoFactory.CreateIOrderImpl().DeleteOrder(OrderID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void PaidOrder(String orderid) {
        try {
            DaoFactory.CreateIOrderImpl().PaidOrder(orderid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<OrderItem> CreatOrderItems(Order order,List<Integer> dishids, List<Integer> thisdishnum) {
        IOrderItemImpl iOrderItem = new IOrderItemImpl();
        List<OrderItem> items = new ArrayList<OrderItem>();
        for (int i=0 ; i<dishids.size() ; i++){
            try {
                items.add(iOrderItem.creatOrderItem(order.getOrderID(),dishids.get(i),thisdishnum.get(i)));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return items;
    }

    @Override
    public Order createOrder(String User, double sumprice) {
        Order order;
        try {
            order = DaoFactory.CreateIOrderImpl().createOrder(User,sumprice);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return order;
    }
}
