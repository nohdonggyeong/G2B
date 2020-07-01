package view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.getInfo;
import model.g2bDTO;

@WebServlet("/g2b")
public class g2b extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		String startDate = request.getParameter("startDate");
		String startTime = request.getParameter("startTime");
		startDate = onlyNumber(startDate + startTime);

		String endDate = request.getParameter("endDate");
		String endTime = request.getParameter("endTime");
		endDate = onlyNumber(endDate + endTime);

		getInfo getInfo = new getInfo();
		ArrayList<g2bDTO> al;
		try {
			al = getInfo.getValueList(startDate, endDate);
			request.setAttribute("al", al);

			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;
		getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	private String onlyNumber(String str) {
		String match = "[^0-9\\s]";
		str = str.replaceAll(match, "");
		return str;
	}

}