package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import DAO.Enterprise_FindDAO;
import DTO.Enterprise_DTO;

public class Enterprise_Find_Show_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		Enterprise_FindDAO dao = new Enterprise_FindDAO();
		
		ArrayList<Enterprise_DTO> list_Enterprise = new ArrayList<>();
		
		dao.getEnterpriseFind(list_Enterprise);
		
		PrintWriter out = response.getWriter();
		for(Enterprise_DTO dto : list_Enterprise) {
			JSONObject o = new JSONObject();
			o.put("c_number", dto.getC_number());
			o.put("name", dto.getName());
			o.put("eamil", dto.getEmail());
			o.put("id", dto.getId());
			o.put("ceo_name", dto.getCeo_name());
			o.put("tel", dto.getTel());
			o.put("address", dto.getAddress());
			o.put("content", dto.getContent());
			o.put("service_content", dto.getService_content());
			o.put("file_name", dto.getFile_name());
			o.put("hitcount", dto.getHitcount());
			o.put("date_time", dto.getDate_time());
			o.put("complete", dto.getComplete());
			o.put("starpoint", dto.getStarpoint());
			o.put("review_count", dao.getReviewCount(dto.getC_number()));
			o.put("review_average", dao.getReviewAverage(dto.getC_number()));
			jarray.add(o);
		}
		json.put("enterprise", jarray);
		out.print(json.toString());
	}

}
