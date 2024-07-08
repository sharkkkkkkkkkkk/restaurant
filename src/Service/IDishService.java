package Service;

import VO.Dish;
import VO.Order;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.List;

public interface IDishService {
    void addCategory(int type,int ID);
    void addDish(Part filePart, Dish dish) throws IOException;
    List<Dish> SearchAllByPage (String CurPage);
    List<Dish> SearchByCategory (String Category);
    int AllTotalPages(String CurPage);
    void DeleteFromCategory(String ID,String type);

}
