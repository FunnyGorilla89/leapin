package Action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import DAO.Enterprise_InformationDAO;
import DTO.Enterprise_DTO;

public class Enterprise_Select_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		String c_number = request.getParameter("c_number");
		Enterprise_InformationDAO dao = new Enterprise_InformationDAO();
		Enterprise_DTO ed = new Enterprise_DTO();
		ed = dao.getEnterprise(c_number);
		PrintWriter out = response.getWriter();
		
		JSONObject o = new JSONObject();
		o.put("c_number", ed.getC_number());
		o.put("name", ed.getName());
		o.put("eamil", ed.getEmail());
		o.put("id", ed.getId());
		o.put("ceo_name", ed.getCeo_name());
		o.put("tel", ed.getTel());
		o.put("address", ed.getAddress());
		o.put("content", ed.getContent());
		o.put("service_content", ed.getService_content());
		o.put("file_name", ed.getFile_name());
		o.put("hitcount", ed.getHitcount());
		o.put("date_time", ed.getDate_time());
		o.put("complete", ed.getComplete());
		o.put("starpoint", ed.getStarpoint());
		o.put("review_count", dao.getReviewCount(ed.getC_number()));
		o.put("review_average", dao.getReviewAverage(ed.getC_number()));
		System.out.println(o.toString());
		
		out.print(o.toString());
	}

}
