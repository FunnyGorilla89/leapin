package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class WriteRequest_Action implements Action{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		ArrayList<String> offer_id = new ArrayList<>();
		String content = request.getParameter("content");
		String file_name = request.getParameter("file_real_name");
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("id : " + id);
		System.out.println("content : " + content);
		System.out.println("cno : " + cno);
		System.out.println("file_name : " + file_name);
		
		LeapinDAO dao = new LeapinDAO();
		JSONObject obj = new JSONObject();
		dao.getEnter_Id(cno,offer_id);
		
		int result = 0;
		for(int i = 0; i < offer_id.size(); i++) {
			dao.writerequest(id,offer_id.get(i),content,cno, file_name);
			result++;
		}
		
		if(result >= 1) {
			obj.put("result", result);	
			out.print(obj.toString());
		}else {
			obj.put("result", result);
			out.print(obj.toString());
		}
		
	}

}
