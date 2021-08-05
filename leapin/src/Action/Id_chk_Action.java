package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class Id_chk_Action implements Action{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		System.out.println(id);
		LeapinDAO dao = new LeapinDAO();
		
		int id_chk = dao.id_chk(id);
		System.out.println(id_chk);
		JSONObject obj = new JSONObject();
		obj.put("id_chk", id_chk);
		out.print(obj);
	}
	
}
