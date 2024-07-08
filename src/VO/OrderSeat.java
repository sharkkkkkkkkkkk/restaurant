package VO;

public class OrderSeat {
    private String OrderID;
    private String SeatID;
    private String User;
    private String Date;
    private String ReservePhone;
    private String ReserveName;

    public String getReservePhone() {
        return ReservePhone;
    }

    public void setReservePhone(String reservePhone) {
        ReservePhone = reservePhone;
    }

    public String getReserveName() {
        return ReserveName;
    }

    public void setReserveName(String reserveName) {
        ReserveName = reserveName;
    }

    public String getIfReserved() {
        return IfReserved;
    }

    private String IfReserved;

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public String getSeatID() {
        return SeatID;
    }

    public void setSeatID(String seatID) {
        SeatID = seatID;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String userID) {
        User = userID;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String isIfReserved() {
        return IfReserved;
    }

    public void setIfReserved(String ifReserved) {
        IfReserved = ifReserved;
    }
}
