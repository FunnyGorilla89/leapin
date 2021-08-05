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
import DTO.Offer_DTO;
import DTO.ReceivedOfferList_DTO;

public class ReceivedOfferlist_Action implements Action{

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String id = request.getParameter("id");
		int cno = Integer.parseInt(request.getParameter("cno"));
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		LeapinDAO dao = new LeapinDAO();
		ArrayList<ReceivedOfferList_DTO> rod = new ArrayList<>();
		ArrayList<String> r1 = new ArrayList<>();
		r1 = dao.ReceiveOfferList(rod, id, cno);
		JSONArray jarray = new JSONArray();
		
		System.out.println("id : " + id);
		for(ReceivedOfferList_DTO r : rod) {
			JSONObject json = new JSONObject();
			json.put("ono", r.getOno());
			json.put("rno", r.getRno());
			json.put("name", r.getName());
			json.put("content", r.getContent());
			json.put("cno", r.getCno());
			json.put("date_time", r.getDate_time());
			json.put("state", r.getState());
			json.put("file_name", r.getFile_name());
			json.put("price", r.getPrice());
			json.put("e_name", r.getE_name());
			json.put("c_name", r.getC_name());
			json.put("warning_cnt", r.getWarning_cnt());
			jarray.add(json);
		}
		System.out.println(jarray);
		obj.put("receivedofferlist", jarray);
		obj.put("r_content", r1.get(0));
		obj.put("r_file_name", r1.get(1));		
		
		out.print(obj.toString());
		
	}
}
