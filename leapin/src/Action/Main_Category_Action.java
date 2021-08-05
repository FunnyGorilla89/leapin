package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import DAO.MainDAO;
import DTO.Category_DTO;

public class Main_Category_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		
		MainDAO dao = new MainDAO();
		ArrayList<Category_DTO> list_Category = new ArrayList<>();
		dao.getCategory(list_Category);

		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		PrintWriter out = response.getWriter();
		for(Category_DTO dto : list_Category) {
			JSONObject o = new JSONObject();
			o.put("cno", dto.getCno());
			o.put("cname", dto.getCname());
			jarray.add(o);
		}
		json.put("category",jarray);
		out.print(json.toString());
	}

}
