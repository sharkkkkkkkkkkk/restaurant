package Service.Impl;

import Dao.Daoimpl.IDishImpl;
import Dao.Daoimpl.IOrderImpl;
import DaoFactory.DaoFactory;
import Service.IDishService;
import VO.Dish;
import VO.Order;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class IDishServiceImpl implements IDishService {
    @Override
    public void addCategory(int type,int ID) {
        String category = null;
        switch (type) {
            case 1:  category = "NewProductsOfTheSeason";
                break;
            case 2: category = "ChefRecommendation";
                break;
            case 3:  category = "PopularSigns";
                break;
            case 4: category = "Vegetarianism";
                break;
            case 5: category = "AluminiumicBeverages";
                break;
        }
        try {
            DaoFactory.CreateIDishImpl().AddDishToCategory(ID,category);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addDish(Part filePart, Dish dish) throws IOException {
        String fileName = filePart.getSubmittedFileName();
        String savePath = "C:\\Users\\Acer1\\Desktop\\restaurant\\web\\page\\iconpicture\\dish\\" + fileName;

        // 将文件保存到指定路径
        filePart.write(savePath);
        try {
            DaoFactory.CreateIDishImpl().AddDish(dish);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Dish> SearchAllByPage(String CurPage) {
        IDishImpl DishRunner = DaoFactory.CreateIDishImpl();
        int PageLength = 5;
        List<Dish> AllDishes;
        try {
            AllDishes = DishRunner.SearchAll();
            AllDishes = DishRunner.SearchAllByPage(Integer.valueOf(CurPage),PageLength,AllDishes.size());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return AllDishes;
    }

    @Override
    public List<Dish> SearchByCategory(String Category) {
        IDishImpl DishRunner = DaoFactory.CreateIDishImpl();
        List<Dish> result;

        try {
            result = DishRunner.SearchByCategory(Category);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public int AllTotalPages(String CurPage) {
        int PageLength = 5;
        IDishImpl DishRunner = DaoFactory.CreateIDishImpl();
        List<Dish> AllDishList = null;
        try {
            AllDishList = DishRunner.SearchAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int TotalPages = AllDishList.size()/PageLength;
        if(AllDishList.size()%PageLength!=0) TotalPages++;
        return TotalPages;
    }


    @Override
    public void DeleteFromCategory(String ID, String type) {
        try {
            DaoFactory.CreateIDishImpl().DeleteFromCategory(Integer.valueOf(ID),type);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
