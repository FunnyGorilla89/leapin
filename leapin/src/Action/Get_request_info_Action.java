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
import DTO.Request_DTO;

public class Get_request_info_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		String uid = request.getParameter("id");
		
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		JSONArray jarray = new JSONArray();
		JSONArray jarray2 = new JSONArray();
		ArrayList<Request_DTO> rarray = new ArrayList<Request_DTO>();
		ArrayList<Offer_DTO> oarray = new ArrayList<>();
		LeapinDAO ld = new LeapinDAO();
		ld.get_send_offer_info_to_receive_request(oarray, uid);
		ld.get_receive_request_info(rarray, uid);
		for(Request_DTO rd : rarray) {
			JSONObject o = new JSONObject();
			o.put("rno", rd.getRno());
			o.put("rid", rd.getRequest_id());
			o.put("oid", rd.getOffer_id());
			o.put("content", rd.getContent());
			o.put("cno", rd.getCno());
			o.put("date_time", rd.getDate_time());
			o.put("state", rd.getState());
			o.put("hitcount", rd.getHitcount());
			o.put("file_name", rd.getFile_name());
			o.put("warning_cnt", ld.get_warning_cnt(rd.getRequest_id()));
			o.put("request_name", ld.get_m_name(rd.getRequest_id()));
			
			jarray.add(o);
		}
		obj.put("r_info", jarray);
		for(Offer_DTO od : oarray) {
			JSONObject o = new JSONObject();
			o.put("o_content",od.getContent());
			o.put("o_date_time",od.getDate_time());
			o.put("o_file_name",od.getFile_name());
			o.put("o_price",od.getPrice());
			jarray2.add(o);
		}
		obj.put("o_info",jarray2);
		out.print(obj);

	}

}
