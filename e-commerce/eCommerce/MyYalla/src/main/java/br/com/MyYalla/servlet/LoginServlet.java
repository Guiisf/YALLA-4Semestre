package br.com.MyYalla.servlet;

import br.com.MyYalla.dao.AdmDao;
import br.com.MyYalla.dao.MyYallaDAO;
import br.com.MyYalla.model.Adm;
import br.com.MyYalla.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");


        Adm admUser = new Adm(username, password);
        boolean isValidAdm = new AdmDao().verifyCredentials(admUser);

        User clientUser = new User(username, password);
        boolean isValidClient = new MyYallaDAO().verifyCredentials(clientUser);

        if (isValidAdm) {
            req.getSession().setAttribute("username", username);
            resp.sendRedirect("/MyYalla/find-all-users");

        } else if (isValidClient) {

            req.getSession().setAttribute("username", username);
            resp.sendRedirect("/MyYalla/.jsp");
        } else {

            req.setAttribute("message", "Credenciais Inválidas, Faça seu cadastro!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }


    }


}