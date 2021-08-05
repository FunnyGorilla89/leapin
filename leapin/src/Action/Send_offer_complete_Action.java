package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;

public class Send_offer_complete_Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("leapin/Send_offer_complete.jsp");
		rd.forward(request, response);

	}

}
