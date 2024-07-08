package VO;

public class Dish {
    private int DishID;
    private String DishName;
    private String DishDescription;
    private String DishImgUrl;

    private double Price;

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getDishID() {
        return DishID;
    }

    public void setDishID(int dishID) {
        DishID = dishID;
    }

    public String getDishName() {
        return DishName;
    }

    public void setDishName(String dishName) {
        DishName = dishName;
    }

    public String getDishDescription() {
        return DishDescription;
    }

    public void setDishDescription(String dishDescription) {
        DishDescription = dishDescription;
    }

    public String getDishImgUrl() {
        return DishImgUrl;
    }

    public void setDishImgUrl(String dishImgUrl) {
        DishImgUrl = dishImgUrl;
    }

}
