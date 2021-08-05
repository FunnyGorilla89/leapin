package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class Enterprise_info_edit_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		String c_number = request.getParameter("c_number");
		String eid = request.getParameter("eid");
		String e_name = request.getParameter("e_name");
		String ceo_name = request.getParameter("ceo_name");
		String eaddress = request.getParameter("eaddress");
		String e_tel = request.getParameter("e_tel");
		String email = request.getParameter("email");
		String service_area = request.getParameter("service_area");
		String content = request.getParameter("content");
		String service_content = request.getParameter("service_content");
		String file_name = request.getParameter("file_real_name");
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("사업자번호 : " + c_number);
		
		LeapinDAO dao = new LeapinDAO();
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		int checkN = dao.enterprise_info_edit(c_number, eid, e_name, ceo_name, eaddress, e_tel, email, service_area, content, service_content, file_name, cno);
		if(checkN>0) {
			System.out.println("A 기업정보수정O");
			obj.put("checkN", checkN);
			out.print(obj);
		}else{
			obj.put("checkN", checkN);
			System.out.println("A 기업정보수정X");
			out.print(obj);
		}
	}

}
