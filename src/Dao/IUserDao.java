package Dao;

import VO.User;

import java.sql.SQLException;

public interface IUserDao {
    Boolean SignUp(User user) throws SQLException;

    User SignIn(String userID,String Password) throws SQLException;

    Boolean IfUserIDExists(String userID) throws SQLException;
}
