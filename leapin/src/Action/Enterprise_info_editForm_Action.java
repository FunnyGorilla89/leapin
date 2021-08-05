package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Enterprise_info_editForm_Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = utf-8");
		
		RequestDispatcher rd = request.getRequestDispatcher("leapin/Enterprise_info_edit.jsp");
		
		rd.forward(request, response);

	}

}
