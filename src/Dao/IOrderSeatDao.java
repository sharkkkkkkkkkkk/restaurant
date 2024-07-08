package Dao;

import VO.OrderSeat;

import java.sql.SQLException;
import java.util.List;

public interface IOrderSeatDao {
    List<OrderSeat> SearchAllOrderByDate(String Date) throws SQLException;
    List<OrderSeat> SearchAllReservation() throws SQLException;
    void Reserve(String Date,String userName,String SeatID,String ReservePhone,String ReserveName) throws SQLException;
    List<OrderSeat> SearchOrderByPage(int curPage,int PageLength,int TotalList) throws SQLException;
    Boolean DeleteOrderByOrderID(String OrderID) throws SQLException;
}
