package Dao.Daoimpl;

import Dao.IOrderItemDao;
import VO.Dish;
import VO.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class IOrderItemImpl implements IOrderItemDao {
    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());

    @Override
    public Boolean DeleteItemByOrderIDDishID(String OrderID, String DishID) throws SQLException {
        String sql = "DELETE FROM `order_dish` WHERE OrderID=? AND DishID=?";
        Object[] params = {OrderID,DishID};
        int state = queryRunner.update(sql, params);
        return (state==1);
    }

    @Override
    public List<OrderItem> SearchOrderItemsByOrderID(String OrderID) throws SQLException {
        String sql = "SELECT * FROM `order_dish` WHERE `OrderID`=?";
        Object[] params = {OrderID};
        List<OrderItem> OrderItem = queryRunner.query(sql, params,new BeanListHandler<OrderItem>(OrderItem.class));
        return OrderItem;
    }

    @Override
    public OrderItem creatOrderItem(String OrderID, int DishID, int num) throws SQLException {
        Dish dish = new IDishImpl().SearchByDishID(DishID);
        String sql = "INSERT INTO `order_dish` (`OrderID`,`DishID`,`DishName`,`Num`) VALUES(?,?,?,?)";
        Object[] params = {OrderID,DishID,dish.getDishName(),num};
        queryRunner.update(sql, params);
        sql = "SELECT * FROM `order_dish` WHERE `OrderID`='"+OrderID+"' AND `DishID`="+DishID;
        OrderItem orderItem = queryRunner.query(sql, new BeanHandler<OrderItem>(OrderItem.class));
        return orderItem;
    }
}
