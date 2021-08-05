package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import DAO.Deal_list_DAO;
import DTO.Deal_List_DTO;

public class Deal_list_request_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		String uid = request.getParameter("id");
		
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		JSONArray jarray = new JSONArray();
		ArrayList<Deal_List_DTO> darray = new ArrayList<>();
		Deal_list_DAO dd = new Deal_list_DAO();
		dd.get_send_request_info(darray, uid);
		
		for(Deal_List_DTO dl : darray) {
			JSONObject o = new JSONObject();
			o.put("c_name", dl.getC_name());
			o.put("r_content", dl.getR_content());
			o.put("r_state", dl.getState());
			o.put("name", dl.getName());
			o.put("o_content", dl.getO_content());
			o.put("price", dl.getPrice());
			o.put("o_date_time", dl.getO_date_time());
			
			jarray.add(o);
		}
		obj.put("cr_info", jarray);
		out.print(obj);

		
	}

}
