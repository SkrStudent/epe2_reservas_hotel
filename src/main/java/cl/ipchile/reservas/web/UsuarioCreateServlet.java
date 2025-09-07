package cl.ipchile.reservas.web;

import cl.ipchile.reservas.dao.UsuarioDAO;
import cl.ipchile.reservas.modelo.Rol;
import cl.ipchile.reservas.modelo.Usuario;
import cl.ipchile.reservas.util.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/usuarios/crear")
public class UsuarioCreateServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // ➜ Ruta correcta del JSP
        req.getRequestDispatcher("/WEB-INF/views/usuarios/crear.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String nombre = trim(req.getParameter("nombre"));
        String email  = trim(req.getParameter("email"));
        String pass   = req.getParameter("password");
        String rolStr = trim(req.getParameter("rol"));

        Map<String,String> errores = new HashMap<>();

        if (nombre == null || nombre.isEmpty()) errores.put("nombre", "Nombre es requerido");
        if (email == null || email.isEmpty()) {
            errores.put("email", "Email es requerido");
        } else if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            errores.put("email", "Formato de email inválido");
        }
        if (pass == null || pass.isEmpty()) errores.put("password", "Contraseña es requerida");

        Rol rol;
        try {
            rol = Rol.valueOf(rolStr == null ? "USER" : rolStr);
        } catch (Exception e) {
            rol = Rol.USER;
        }

        if (!errores.isEmpty()) {
            req.setAttribute("errores", errores);
            req.setAttribute("nombre", nombre);
            req.setAttribute("email", email);
            req.setAttribute("rol", rol.name());
            // ➜ Mismo JSP cuando hay errores
            req.getRequestDispatcher("/WEB-INF/views/usuarios/crear.jsp")
                    .forward(req, resp);
            return;
        }

        // Guardar
        String hash = PasswordUtil.sha256(pass);
        Usuario u = new Usuario(nombre, email, hash, rol);

        try {
            usuarioDAO.crear(u);
            resp.sendRedirect(req.getContextPath() + "/usuarios?ok=1");
        } catch (Exception ex) {
            errores.put("email", "El email ya está registrado");
            req.setAttribute("errores", errores);
            req.setAttribute("nombre", nombre);
            req.setAttribute("email", email);
            req.setAttribute("rol", rol.name());
            req.getRequestDispatcher("/WEB-INF/views/usuarios/crear.jsp")
                    .forward(req, resp);
        }
    }

    private String trim(String s) { return s == null ? null : s.trim(); }
}
