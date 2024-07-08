package ServiceFactory;

import Service.Impl.IChartServiceImpl;
import Service.Impl.IDishServiceImpl;
import Service.Impl.IOrderSeatServiceImpl;
import Service.Impl.IOrderServiceImpl;

public class ServiceFactory {
    public static IDishServiceImpl CreateIDishServiceImpl(){
        return new IDishServiceImpl();
    }
    public static IChartServiceImpl CreateIChartServiceImpl() {
        return new IChartServiceImpl();
    }
    public static IOrderServiceImpl CreateIOrderServiceImpl(){
        return new IOrderServiceImpl();
    }
    public static IOrderSeatServiceImpl CreateIOrderSeatServiceImpl(){
        return new IOrderSeatServiceImpl();
    }
}
