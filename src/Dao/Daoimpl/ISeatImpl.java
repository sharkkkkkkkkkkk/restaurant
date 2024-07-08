package Dao.Daoimpl;

import Dao.ISeatDao;
import VO.Seat;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class ISeatImpl implements ISeatDao {
    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    @Override
    public List<Seat> SearchAllSeat() throws SQLException {
        String sql = "SELECT * FROM `seat`";
        List<Seat> result = queryRunner.query(sql,new BeanListHandler<Seat>(Seat.class));

        return result;
    }
}
