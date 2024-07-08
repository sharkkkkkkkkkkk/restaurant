package Dao.Daoimpl;

import Dao.IChartDao;
import VO.CarouselChart;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class IChartImpl implements IChartDao {
    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    @Override
    public List<CarouselChart> SearchAll() throws SQLException {
        String sql = "SELECT * FROM `carousel_chart`";
        List<CarouselChart> result = queryRunner.query(sql,new BeanListHandler<CarouselChart>(CarouselChart.class));
        return result;
    }

    @Override
    public void addChart(String filename) throws SQLException {
        String sql = "INSERT INTO `carousel_chart` (`src`) VALUES (?)";
        Object[] params = {filename};
        queryRunner.update(sql,params);
    }

    @Override
    public void removeChart(String filename) throws SQLException {
        String sql = "DELETE FROM `carousel_chart` WHERE `src` =?";
        Object[] params = {filename};
        queryRunner.update(sql,params);
    }
}
