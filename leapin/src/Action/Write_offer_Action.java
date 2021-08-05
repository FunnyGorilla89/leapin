package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class Write_offer_Action implements Action{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String file_name = request.getParameter("file_real_name");
		String price = request.getParameter("price");
		System.out.println("r : "+request.getParameter("rno"));
		String r = request.getParameter("rno");
		int rno = Integer.parseInt(r);
		
		LeapinDAO ld = new LeapinDAO();
		int cno = ld.get_cno_from_rno(rno);
		boolean result = ld.write_offer(rno, id, content, file_name, price,cno);
		System.out.println(result);
		if(result) {
			JSONObject obj = new JSONObject();
			ld.update_request_state(rno);
			obj.put("success", "1");
			System.out.println("견적서 등록완료");
			out.print(obj.toString());
		}else {
			System.out.println("견적서 등록실패");
		}
	}

}
