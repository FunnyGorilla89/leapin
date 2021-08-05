package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class Member_info_edit_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		String eid = request.getParameter("eid");
		String epw = request.getParameter("epw");
		String ename = request.getParameter("ename");
		String eaddress = request.getParameter("eaddress");
		String ephone = request.getParameter("ephone");
		
		System.out.println("eid : " + eid);
		System.out.println("eaddress : " + eaddress);
		System.out.println("epw : " + epw);
		System.out.println("ename : " + ename);
		System.out.println("ephone : " + ephone);
		LeapinDAO dao = new LeapinDAO();
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		int checkN = dao.member_info_edit(epw, ename, eaddress, ephone, eid);
		if(checkN>0) {
			obj.put("checkN", checkN);
			out.print(obj);
		}else{
			obj.put("checkN", checkN);
			out.print(obj);
		}
	}

}
