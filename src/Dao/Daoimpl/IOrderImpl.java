package Dao.Daoimpl;

import Dao.IOrderDao;
import VO.Order;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

public class IOrderImpl implements IOrderDao {
    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    @Override
    public Order createOrder(String User, Double Price) throws SQLException {
        String ID = UUID.randomUUID().toString();
        String sql = "INSERT INTO `order`(`OrderID`,`OrderPrice`,`User`) VALUES (?,?,?)";
        Object[] params = {ID,Price,User};
        queryRunner.update(sql, params);
        sql = "SELECT * FROM `order` WHERE `OrderID`='"+ID+"'";
        Order order = queryRunner.query(sql,new BeanHandler<Order>(Order.class));
        return order;
    }

    @Override
    public List<Order> SearchAllOrder() throws SQLException {
        String sql = "SELECT * FROM `order`";
        List<Order> orderList = queryRunner.query(sql,new BeanListHandler<Order>(Order.class));
        return orderList;
    }

    @Override
    public Boolean PaidOrder(String OrderID) throws SQLException {
        String sql = "UPDATE `order` SET IfPaid='true' WHERE OrderID='" + OrderID +"'";
        int state = queryRunner.update(sql);
        return (state == 1);
    }

    @Override
    public List<Order> SearchAllByPage(int curPage, int PageLength, int TotalList) throws SQLException {
        String sql = "SELECT * FROM `order` ORDER BY `OrderTime` LIMIT ?,?";
        int index = PageLength*(curPage-1);
        if((TotalList-index)<PageLength){
            PageLength = TotalList-index;
        }
        Object[] params = {index, PageLength};
        List<Order> OrderList = queryRunner.query(sql, params, new BeanListHandler<Order>(Order.class));
        return OrderList;
    }

    @Override
    public Boolean DeleteOrder(String OrderID) throws SQLException {
        //删除所有关联菜品
        String sql = "DELETE FROM `order_dish` WHERE OrderID=?";
        Object[] params = {OrderID};
        queryRunner.update(sql,params);

        //删除订单
        sql = "DELETE FROM `order` WHERE OrderID=?";
        int state = queryRunner.update(sql,params);
        return (state==1);
    }
}
