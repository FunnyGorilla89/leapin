package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;
import DTO.Member_DTO;

public class Sign_up_Action implements Action{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		System.out.println(phone);
		
		PrintWriter out = response.getWriter();
		LeapinDAO dao = new LeapinDAO();
		int Sign_up = dao.Sign_up(id, pw, name, address, phone);
		System.out.println(Sign_up);
		JSONObject obj = new JSONObject();
		if(Sign_up == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", id);
			obj.put("Sign_up", Sign_up);
			out.print(obj);	
		}
	}	
}