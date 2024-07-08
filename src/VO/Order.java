package VO;

public class Order {
    private String OrderID;
    private String OrderTime;
    private String OrderPrice;
    private String User;
    private String IfPaid;

    public String getIfPaid() {
        return IfPaid;
    }

    public void setIfPaid(String ifPaid) {
        IfPaid = ifPaid;
    }

    public String getOrderID() {

        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public String getOrderTime() {
        return OrderTime;
    }

    public void setOrderTime(String orderTime) {
        OrderTime = orderTime;
    }

    public String getOrderPrice() {
        return OrderPrice;
    }

    public void setOrderPrice(String orderPrice) {
        OrderPrice = orderPrice;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        User = user;
    }
}
