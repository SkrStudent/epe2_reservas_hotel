package cl.ipchile.reservas.web;

import cl.ipchile.reservas.dao.UsuarioDAO;
import cl.ipchile.reservas.modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/usuarios")
public class UsuarioListServlet extends HttpServlet {
    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Usuario> usuarios = usuarioDAO.listarTodos();
        req.setAttribute("usuarios", usuarios);
        req.getRequestDispatcher("/usuarios.jsp").forward(req, resp);
    }
}
