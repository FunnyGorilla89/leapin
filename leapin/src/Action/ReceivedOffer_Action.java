package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import DAO.LeapinDAO;
import DTO.ReceivedOffer_DTO;

public class ReceivedOffer_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		
		String id = request.getParameter("id");
		
		System.out.println("id = " + id);
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		ArrayList<ReceivedOffer_DTO> rod = new ArrayList<>();
		LeapinDAO dao = new LeapinDAO();
		
		JSONArray jarray = new JSONArray();
		dao.Receivedoffer(rod, id);
		for(ReceivedOffer_DTO r : rod) {
			int count = 0;
			JSONObject json = new JSONObject();
			json.put("date_time", r.getDate_time());
			json.put("e_name", r.getE_name());
			json.put("c_name", r.getC_name());
			json.put("cno", r.getCno());
			System.out.println("servlet count1 : " + count);
			count = dao.getEnterCount(id, r.getCno());
			System.out.println("servlet count2 : " + count);
			json.put("count",count);
			jarray.add(json);
		}
		obj.put("receivedoffer", jarray);
		out.print(obj.toString());
		
	}

}
