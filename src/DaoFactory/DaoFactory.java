package DaoFactory;

import Dao.Daoimpl.*;

public class DaoFactory {
    public static IChartImpl CreateIChartImpl (){
        return new IChartImpl();
    }
    public static IDishImpl CreateIDishImpl(){
        return new IDishImpl();
    }
    public static IOrderImpl CreateIOrderImpl(){
        return new IOrderImpl();
    }
    public static IOrderItemImpl CreateIOrderItemImpl() {
        return new IOrderItemImpl();
    }

    public static IOrderSeatImpl CreateIOrderSeatImpl(){
        return new IOrderSeatImpl();
    }
    public static ISeatImpl CreateISeatImpl(){
        return new ISeatImpl();
    }
    public static IUserImpl CreateIUserImpl(){
        return new IUserImpl();
    }
}
