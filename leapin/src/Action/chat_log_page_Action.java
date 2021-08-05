package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class chat_log_page_Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("leapin/chat_log.jsp");
		String ono = request.getParameter("ono");
		System.out.println(ono);
		request.setAttribute("ono", ono);
		rd.forward(request, response);
	

	}

}
