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
import DTO.Category_DTO;

public class Get_category_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		ArrayList<Category_DTO> carray = new ArrayList<Category_DTO>();
		LeapinDAO ld = new LeapinDAO();
		ld.get_category(carray);
		for(Category_DTO cd : carray) {
			JSONObject o = new JSONObject();
			o.put("cno", cd.getCno());
			o.put("c_name", cd.getCname());
			jarray.add(o);		
			
		}
		json.put("category", jarray);
		out.print(json);

	}

}
