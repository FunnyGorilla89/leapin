package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.Enterprise_FindDAO;
import DTO.Enterprise_DTO;

public class Enterprise_Count_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		
		Enterprise_FindDAO dao = new Enterprise_FindDAO();
		PrintWriter out = response.getWriter();
		
		JSONObject json = new JSONObject();
		int count = dao.getEnterpriseCount();
		json.put("count", count);
		
		out.print(json);
	}

}
