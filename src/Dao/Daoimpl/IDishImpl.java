package Dao.Daoimpl;

import Dao.IDishDao;
import VO.Dish;
import VO.Dish_Category;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class IDishImpl implements IDishDao {
    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    @Override
    public List<Dish> SearchAll() throws SQLException {
        String sql = "SELECT * FROM `dish`";
        List<Dish> Dishes = queryRunner.query(sql, new BeanListHandler<Dish>(Dish.class));
        return Dishes;
    }

    @Override
    public List<Dish> SearchByCategory(String category) throws SQLException {
        String sql = "SELECT dish.`DishID`,`DishName`,`DishDescription`,`DishImgUrl`,`Price` " +
                "FROM `dish` INNER JOIN `dishcategory` ON dish.`DishID`=dishcategory.`DishID` " +
                "WHERE dishcategory.Category='"+category+"'";
        List<Dish> Dishes =  queryRunner.query(sql, new BeanListHandler<Dish>(Dish.class));
        return  Dishes;
    }

    @Override
    public Boolean AddDish(Dish dst) throws SQLException {
        String sql = "INSERT INTO `dish`(`DishName`,`DishDescription`,`DishImgUrl`,`Price`) " +
                "VALUES(?,?,?,?)";
        Object[] params = {dst.getDishName(),dst.getDishDescription(),dst.getDishImgUrl(),dst.getPrice()};
        int state;
        state = queryRunner.update(sql, params);
        return (state == 1);
    }

    @Override
    public Boolean AddDishToCategory(int ID, String Category) throws SQLException {
        String sql = "SELECT * FROM `dishcategory` WHERE DishID = ? AND Category = ?";
        Object[] params1 = {ID, Category};
        Dish_Category state = queryRunner.query(sql, params1, new BeanHandler<Dish_Category>(Dish_Category.class));
        if(state != null){return false;}
        sql = "INSERT INTO `dishcategory`(`DishID`,`Category`)" +
                "VALUES(?,?)";
        Object[] params2 = {ID,Category};
        int result = queryRunner.update(sql, params2);
        return (result == 1);
    }

    @Override
    public List<Dish> SearchAllByPage(int curPage,int PageLength,int TotalList) throws SQLException {
        String sql = "SELECT * FROM `dish` LIMIT ?,?";
        int index = PageLength*(curPage-1);
        if((TotalList-index)<PageLength){
            PageLength = TotalList-index;
        }
        Object[] params = {index, PageLength};
        List<Dish> DishList = queryRunner.query(sql, params, new BeanListHandler<Dish>(Dish.class));
        return DishList;
    }

    @Override
    public Boolean DeleteFromCategory(int ID, String Category) throws SQLException {
        String sql = "DELETE FROM `dishcategory` WHERE DishID=? && Category=?";
        Object[] params2 = {ID,Category};
        int state = queryRunner.update(sql, params2);
        return (state == 1);
    }

    @Override
    public Dish SearchByDishID(int DishID) throws SQLException {
        String sql = "SELECT `DishID`,`DishName`,`DishDescription`,`DishImgUrl` " +
                "FROM dish WHERE DishID="+DishID;
        Dish dish = queryRunner.query(sql,new BeanHandler<Dish>(Dish.class));
        return dish;
    }
}
