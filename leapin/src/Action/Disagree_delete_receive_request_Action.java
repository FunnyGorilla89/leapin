package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.LeapinDAO;

public class Disagree_delete_receive_request_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		LeapinDAO ld = new LeapinDAO();
		boolean result = ld.delete_receive_request_from_list(rno);
		if(result) {
			JSONObject obj = new JSONObject();
			obj.put("deleteN", "1");
			System.out.println("리스트에서 받은요청서 삭제완료");
			out.print(obj);
		}else {
			System.out.println("받은요청서 삭제실패");
		}
		
	}

}
