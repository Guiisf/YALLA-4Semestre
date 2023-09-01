package br.com.MyYalla.servlet;

import br.com.MyYalla.dao.*;
import br.com.MyYalla.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-users")

public class ListUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if (null == request.getSession().getAttribute("username")) {


            request.setAttribute("message", "Credenciais Invalidas, voce nao é do Grupo!");


            request.getRequestDispatcher(".jsp").forward(request, response);

        } else {
            List<User> usuarios = new MyYallaDAO().findAllUsers();

            request.setAttribute("usuarios", usuarios);

            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }

    }
}
