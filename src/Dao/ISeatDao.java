package Dao;

import VO.Seat;

import java.sql.SQLException;
import java.util.List;

public interface ISeatDao {
    List<Seat> SearchAllSeat() throws SQLException;
}
