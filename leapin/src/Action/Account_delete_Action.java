package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class Account_delete_Action implements Action {
	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		String loginId = null;
		HttpSession session = request.getSession();
		loginId = (String)(session.getAttribute("loginId"));
		
		PrintWriter out = response.getWriter();
		LeapinDAO dao = new LeapinDAO();
		int deleteN = 0;
		deleteN = dao.account_delete(loginId);
		
		if(deleteN==1) {
			JSONObject obj = new JSONObject();
			obj.put("deleteN", deleteN);
			out.print(obj);
			session.removeAttribute("loginId");
			session.removeAttribute("E");
		}else {
			JSONObject obj = new JSONObject();
			obj.put("deleteN", deleteN);
			out.print(obj);
		}
		
	}

}
