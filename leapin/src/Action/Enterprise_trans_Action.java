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

public class Enterprise_trans_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String c_number = request.getParameter("c_number");
		String id = (String)(session.getAttribute("loginId"));
		String name = request.getParameter("e_name");
		String ceo_name = request.getParameter("ceo_name");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String service_area = request.getParameter("service_area");
		String content = request.getParameter("content");
		String service_content = request.getParameter("service_content");
		String file_name = request.getParameter("file_real_name");
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("id : " + id);
		
		PrintWriter out = response.getWriter();
		LeapinDAO dao = new LeapinDAO();
		JSONObject obj = new JSONObject();
		int checkN = 0;
		checkN = dao.enterprise_trans(c_number, name, email, id, ceo_name, tel, address, service_area, cno, content, service_content, file_name);
		System.out.println("checkN : "+checkN);
		if(checkN == 1) {
			session.setAttribute("E", id);
			obj.put("checkN", checkN);
			out.print(obj);	
		}else {
			obj.put("checkN", checkN);
			out.print(obj);	
		}

	}

}
