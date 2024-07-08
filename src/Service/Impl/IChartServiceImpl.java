package Service.Impl;

import Dao.Daoimpl.IChartImpl;
import DaoFactory.DaoFactory;
import Service.IChartService;
import VO.CarouselChart;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class IChartServiceImpl implements IChartService {
    @Override
    public void addCarouselChart(Part filePart) throws IOException {
        String fileName = filePart.getSubmittedFileName();
        String savePath = "C:\\Users\\Acer1\\Desktop\\restaurant\\web\\page\\iconpicture\\advertise\\" + fileName;
        // 将文件保存到指定路径
        filePart.write(savePath);
        //写入数据库
        try {
            DaoFactory.CreateIChartImpl().addChart(fileName);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<CarouselChart> SearchAllCharts() {
        IChartImpl ChartRunner = DaoFactory.CreateIChartImpl();
        List<CarouselChart> ChartList;
        try {
            ChartList = ChartRunner.SearchAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ChartList;
    }

    @Override
    public void deleteCarouselChart(String name) {
        File Chart = new File("C:\\Users\\Acer1\\Desktop\\restaurant\\web\\page\\iconpicture\\advertise\\"+name);
        Chart.delete();
        try {
            DaoFactory.CreateIChartImpl().removeChart(name);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
