package servlet;

import Dao.Daoimpl.IUserImpl;
import DaoFactory.DaoFactory;
import VO.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
@WebServlet(
        urlPatterns = "/Sign_InServlet"
)
public class Sign_InServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        IUserImpl Iuserimpl = DaoFactory.CreateIUserImpl();
        Boolean state;

        try {
            state = Iuserimpl.IfUserIDExists(username);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if(!state){
            session.setAttribute("IfSuccess", "false");
            session.setAttribute("errortype","NotUserExist");
            resp.sendRedirect("page/transfer.jsp");
            return;
        }
        User user ;
        try {
             user = Iuserimpl.SignIn(username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if(user.getPassword().equals(password)){
            session.setAttribute("IfSuccess", "true");
            session.setAttribute("signin","true");
            session.setAttribute("mod","signin");
            session.setAttribute("UserName",username);
            session.setAttribute("UserLevel",user.getLevel());
            resp.sendRedirect("page/transfer.jsp");
        }
        else{
            session.setAttribute("IfSuccess", "false");
            session.setAttribute("errortype","WrongPassword");
            resp.sendRedirect("page/transfer.jsp");
            return;
        }
    }
}
