package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class Pwcheck_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("!!");
		response.setContentType("json/application; charset=utf-8");
		String mpw = request.getParameter("pw");
		String loginId = null;
		HttpSession session = request.getSession();
		loginId = (String)(session.getAttribute("loginId"));
		
		PrintWriter out = response.getWriter();
		LeapinDAO dao = new LeapinDAO();
		String receivepw = dao.getpw(loginId);
			
		if(mpw.equals(receivepw)) {
			JSONObject obj = new JSONObject();
			obj.put("mpw", mpw);
			out.print(obj);
			System.out.println("비밀번호일치!");
		}else {
			JSONObject obj = new JSONObject();
			obj.put("mpw", null);
			out.print(obj);
			System.out.println("비밀번호가 일치하지 않습니다.");
		}
	}

}
