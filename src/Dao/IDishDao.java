package Dao;

import VO.Dish;

import java.sql.SQLException;
import java.util.List;

public interface IDishDao {
    List<Dish> SearchAll() throws SQLException;
    List<Dish> SearchByCategory(String category) throws SQLException;
    Dish SearchByDishID(int DishID) throws SQLException;
    Boolean AddDish(Dish dst) throws SQLException;
    Boolean AddDishToCategory(int ID,String Category) throws SQLException;
    Boolean DeleteFromCategory(int ID,String Category) throws SQLException;
    List<Dish> SearchAllByPage(int curPage,int PageLength,int TotalList) throws SQLException;
}
