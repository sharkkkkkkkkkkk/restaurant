package Service;

import VO.Order;
import VO.OrderItem;

import java.util.List;

public interface IOrderService {
    int OrderTotalPages(String CurPage);
    List<Order> SearchOrderByPage(String CurPage);
    List<OrderItem> SearchOrderItemByID(String OrderID);
    List<OrderItem> CreatOrderItems(Order order,List<Integer> dishids, List<Integer> thisdishnum);
    void DeleteItemByOrderIDDishID(String OrderID,String DishID);
    Order createOrder(String User,double sumprice);
    void DeleteOrder(String OrderID);
    void PaidOrder(String orderid);
}
