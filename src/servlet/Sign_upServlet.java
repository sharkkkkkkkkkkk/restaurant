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
        urlPatterns = "/Sign_upServlet"
)
public class Sign_upServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Email = (String) req.getParameter("Email");
        String UserID = (String) req.getParameter("UserID");
        String Password = (String) req.getParameter("Password");
        String Phone = (String) req.getParameter("Phone");

        HttpSession session = req.getSession();
        IUserImpl userimpl = DaoFactory.CreateIUserImpl();
        Boolean IfUserIDExists;
        try {
            IfUserIDExists = userimpl.IfUserIDExists(UserID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        session.setAttribute("mod","signup");
        if(IfUserIDExists){
            session.setAttribute("IfSuccess","false");
            session.setAttribute("errortype","UserIDExist");
            resp.sendRedirect("page/transfer.jsp");
            return;
        }

        User user = new User();
        user.setEmail(Email);
        user.setUserID(UserID);
        user.setPassword(Password);
        user.setPhone(Phone);
        user.setLevel("simple");
        Boolean state;
        try {
            state = userimpl.SignUp(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if(state) {
            session.setAttribute("IfSuccess", "true");
            resp.sendRedirect("page/transfer.jsp");
        }
        else{
            session.setAttribute("IfSuccess","false");
            session.setAttribute("errortype","Unknown");
            resp.sendRedirect("page/transfer.jsp");
        }


    }
}
