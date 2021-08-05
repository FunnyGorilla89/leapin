package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

@SuppressWarnings("unused")
public class Login_Action implements Action{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String u_id = request.getParameter("u_id");
		String pwd = request.getParameter("pwd");

		LeapinDAO dao = new LeapinDAO();
		int result = dao.login_chk(u_id, pwd);   // 0 : 로그인 성공 , 1 : 로그인 실패
		String Echeck = dao.enterprise_Chk(u_id);
		HttpSession session = request.getSession();

		if(result==0) {
			session.setAttribute("loginId", u_id);				
			// 로그인 성공 ---> 세션에 로그인 아이디를 담아.
			if(Echeck!=null) {
				session.setAttribute("E", Echeck);
				System.out.println(Echeck);
			}
		}
		
		//if(Session.getAttribute("loginId") != null) {
		//	loginId = (String)Session.getAttribute("loginId");
		//}
		
		response.setContentType("application/json; charset = utf-8");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		out.print(obj);
		
//		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=Login");
//		request.setAttribute("u_id", u_id);
//		request.setAttribute("pwd", pwd);
//		rd.forward(request, response);
		
	}
	
}
