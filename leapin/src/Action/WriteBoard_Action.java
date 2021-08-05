package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class WriteBoard_Action implements Action{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
	
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(id);
		System.out.println(title);
		System.out.println(content);
		
		PrintWriter out = response.getWriter();
		
		LeapinDAO dao = new LeapinDAO();
		JSONObject obj = new JSONObject();
		
		obj.put("update", dao.boardwrite(id, title, content));
		
		out.print(obj.toString());
		
	}

}
