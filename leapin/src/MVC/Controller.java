package MVC;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Action.Action;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")	// Controller?command = calculate ---? CalAction
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Controller() {

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/text; charset=UTF-8");
		String command = request.getParameter("command");
		System.out.println(command);
		ActionFactory af = ActionFactory.getInstance();
		Action action = af.getAction(command);
		if(action != null) {
			action.execute(request, response);
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}
}
