package Service.Impl;

import Dao.Daoimpl.IOrderSeatImpl;
import DaoFactory.DaoFactory;
import Service.IOrderSeatService;
import VO.OrderSeat;
import VO.Seat;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class IOrderSeatServiceImpl implements IOrderSeatService {
    @Override
    public int TotalPages() {
        List<OrderSeat> AllOrderList;
        int PageLength = 14;
        Dao.Daoimpl.IOrderSeatImpl orderSeatRunner = DaoFactory.CreateIOrderSeatImpl();
        try {
            AllOrderList = orderSeatRunner.SearchAllReservation();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int TotalPages = AllOrderList.size()/PageLength;
        if(AllOrderList.size()%PageLength!=0) TotalPages++;
        return TotalPages;
    }

    @Override
    public List<OrderSeat> SearchOrderSeatByPage(String CurPage) {
        Dao.Daoimpl.IOrderSeatImpl orderSeatRunner = DaoFactory.CreateIOrderSeatImpl();
        List<OrderSeat> OrderSeatList;
        try {
            OrderSeatList = orderSeatRunner.SearchAllReservation();
            OrderSeatList = orderSeatRunner.SearchOrderByPage(Integer.valueOf(CurPage),14,OrderSeatList.size());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return OrderSeatList;
    }

    @Override
    public void DeleteOrderByOrderID(String SeatOrderID) {
        try {
            DaoFactory.CreateIOrderSeatImpl().DeleteOrderByOrderID(SeatOrderID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<String> CalculateDateList() {
        LocalDate dateTime = LocalDate.now();

        List<String> Datelist = new ArrayList<String>();
        for(int i = 0;i<5;i++){
            Datelist.add(dateTime.plusDays(i).toString());
        }
        return Datelist;
    }

    @Override
    public List[] SearchReservationList() {
        List[] ReservationList  =  new List[5];
        List<String> Datelist = CalculateDateList();
        for(int i = 0;i<ReservationList.length;i++){
            try {
                ReservationList[i] = new IOrderSeatImpl().SearchAllOrderByDate(Datelist.get(i));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return ReservationList;
    }

    @Override
    public List<Seat> SearchAllSeat() {
        List<Seat> Seatlist = null;
        try {
            Seatlist = DaoFactory.CreateISeatImpl().SearchAllSeat();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Seatlist;
    }

    @Override
    public void SubmitOrderSeat(String Date, String userName, String SeatID, String ReservePhone, String ReserveName) {
        try {
            DaoFactory.CreateIOrderSeatImpl().Reserve(Date,userName,SeatID,ReservePhone,ReserveName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
