package com.kh.simdo.papago;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PapagoController
 */
@WebServlet("/papago/*")
public class PapagoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    PapagoService papagoService = new PapagoService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PapagoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String[] uriArr = uri.split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "write.do": request.getRequestDispatcher("/WEB-INF/view/papago.jsp").forward(request, response);
			break;
		case "translation.do": 
			String text = request.getParameter("text");
			String res = papagoService.papagoAPI(text);
			
			if(res != null) {
				response.getWriter().print(res);
			} else {
				response.getWriter().print("fail");
			}
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
