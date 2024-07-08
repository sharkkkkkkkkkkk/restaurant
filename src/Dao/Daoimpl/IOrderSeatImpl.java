package Dao.Daoimpl;

import Dao.IOrderSeatDao;
import VO.OrderSeat;
import VO.Seat;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

public class IOrderSeatImpl implements IOrderSeatDao {


    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    @Override
    public void Reserve(String Date, String userName,String SeatID, String ReservePhone, String ReserveName) throws SQLException {
        String OrderID =  UUID.randomUUID().toString();
        String sql = "UPDATE `order_seat` SET OrderID=?,User=?,ReservePhone=?,ReserveName=?,IfReserved='true'" +
                "WHERE SeatID=? AND Date=?";
        Object[] params = {OrderID,userName,ReservePhone,ReserveName,SeatID,Date};
        queryRunner.update(sql, params);
    }
    @Override
    public List<OrderSeat> SearchAllOrderByDate(String Date) throws SQLException {
        String sql = "SELECT * FROM `order_seat` WHERE `Date`='"+Date+"'";
        List<OrderSeat> AllReservations =  queryRunner.query(sql, new BeanListHandler<OrderSeat>(OrderSeat.class));
        //没找到就插入
        if (AllReservations.size()==0){
            sql = "SELECT * FROM `seat`";
            List<Seat> seats = new ISeatImpl().SearchAllSeat();
            sql = "INSERT INTO `order_seat` (`SeatID`,`Date`,`IfReserved`) VALUES (?,?,?)";
            for(Seat seat : seats){
                Object[] params = {seat.getSeatID(),Date,"false"};
                queryRunner.update(sql,params);
            }
            sql = "SELECT * FROM `order_seat` WHERE `Date`='"+Date+"'";
            AllReservations =  queryRunner.query(sql, new BeanListHandler<OrderSeat>(OrderSeat.class));
        }


        return  AllReservations;
    }

    @Override
    public List<OrderSeat> SearchAllReservation() throws SQLException {
        String sql = "SELECT * FROM `order_seat`";
        return queryRunner.query(sql, new BeanListHandler<OrderSeat>(OrderSeat.class));
    }

    @Override
    public List<OrderSeat> SearchOrderByPage(int curPage, int PageLength, int TotalList) throws SQLException {
        String sql = "SELECT * FROM `order_seat` LIMIT ?,?";
        int index = PageLength*(curPage-1);
        if((TotalList-index)<PageLength){
            PageLength = TotalList-index;
        }
        Object[] params = {index, PageLength};
        List<OrderSeat> OrderList = queryRunner.query(sql, params, new BeanListHandler<OrderSeat>(OrderSeat.class));
        return OrderList;
    }

    @Override
    public Boolean DeleteOrderByOrderID(String OrderID) throws SQLException {
        String sql = "UPDATE `order_seat` SET OrderID=null,User=null,ReservePhone=null,ReserveName=null,IfReserved='false' WHERE OrderID=?";
        Object[] params = {OrderID};
        int state = queryRunner.update(sql,params);
        return (state==1);
    }
}
