package Dao;

import VO.CarouselChart;

import java.sql.SQLException;
import java.util.List;

public interface IChartDao{
    List<CarouselChart> SearchAll() throws SQLException;
    void addChart(String filename) throws SQLException;
    void removeChart(String filename) throws SQLException;
}
