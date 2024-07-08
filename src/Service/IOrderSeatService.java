package Service;

import VO.OrderSeat;
import VO.Seat;

import java.util.List;

public interface IOrderSeatService {
    int TotalPages();
    List<OrderSeat> SearchOrderSeatByPage(String CurPage);
    void DeleteOrderByOrderID(String SeatOrderID);
    List<String> CalculateDateList();
    List[] SearchReservationList();
    List<Seat> SearchAllSeat();
    void SubmitOrderSeat(String Date, String userName,String SeatID, String ReservePhone, String ReserveName);
}
