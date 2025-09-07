package cl.ipchile.reservas.web;

import cl.ipchile.reservas.dao.HotelDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/hoteles")
public class HotelListServlet extends HttpServlet {

    private final HotelDAO hotelDAO = new HotelDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("hoteles", hotelDAO.listar());
        req.getRequestDispatcher("/WEB-INF/views/hoteles/lista.jsp").forward(req, resp);
    }
}
