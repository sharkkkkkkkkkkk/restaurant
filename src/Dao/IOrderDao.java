package Dao;

import VO.Order;

import java.sql.SQLException;
import java.util.List;

public interface IOrderDao {
    Order createOrder(String User,Double Price) throws SQLException;
    List<Order> SearchAllOrder() throws SQLException;
    List<Order> SearchAllByPage(int curPage,int PageLength,int TotalList) throws SQLException;
    Boolean PaidOrder(String OrderID) throws SQLException;
    Boolean DeleteOrder(String OrderID) throws SQLException;
}
