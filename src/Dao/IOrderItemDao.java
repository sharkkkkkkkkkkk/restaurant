package Dao;

import VO.OrderItem;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface IOrderItemDao {
    OrderItem creatOrderItem(String OrderID,int DishID,int num) throws SQLException;
    List<OrderItem> SearchOrderItemsByOrderID(String OrderID) throws SQLException ;
    Boolean DeleteItemByOrderIDDishID(String OrderID,String DishID) throws SQLException;
}
