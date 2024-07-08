package Dao.Daoimpl;

import Dao.IUserDao;
import VO.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import util.DataSourceUtils;

import java.sql.SQLException;

public class IUserImpl implements IUserDao {
    QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
    @Override
    public Boolean SignUp(User user) throws SQLException {
        String sql = "INSERT INTO `user` (`UserID`,`Password`,`Phone`,`Email`,`Level`) " +
                "VALUES (?,?,?,?,?)";
        Object[] params = {user.getUserID(),user.getPassword(),user.getPhone(),user.getEmail(),user.getLevel()};
        int state = queryRunner.update(sql, params);
        return (state==1);
    }

    @Override
    public Boolean IfUserIDExists(String userID) throws SQLException {
        String sql = "SELECT * FROM `user` WHERE `UserID`='"+userID+"'";
        User user = queryRunner.query(sql,new BeanHandler<User>(User.class));
        if(user!=null){
            return true;
        }
        else return false;
    }

    @Override
    public User SignIn(String userID, String Password) throws SQLException {
       String sql = "SELECT * FROM `user` WHERE `UserID`='"+userID+"'";
       User user = queryRunner.query(sql,new BeanHandler<User>(User.class));
       return  user;
    }
}
