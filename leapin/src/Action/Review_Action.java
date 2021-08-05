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
import DTO.Review_DTO;

public class Review_Action implements Action {

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		String c_number = request.getParameter("c_number");
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("null")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int rowSize = 3;
		int startnum = (currentPage - 1) * rowSize + 1;
		int endnum = currentPage * rowSize;
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		Enterprise_FindDAO dao = new Enterprise_FindDAO();
		ArrayList<Review_DTO> list_Review = new ArrayList<>();
		int count = dao.getReview3(list_Review , c_number, startnum, endnum);
		System.out.println(count);
		if(count < 3) {
			json.put("result", "1");
		}else {
			json.put("result", "2");
		}
		PrintWriter out = response.getWriter();
		
		for(Review_DTO dto : list_Review) {
			JSONObject json2 = new JSONObject();
			json2.put("rdx", dto.getRdx());
			json2.put("content", dto.getContent());
			json2.put("writer", dto.getWriter());
			json2.put("starpoint", dto.getStarpoint());
			json2.put("c_number", dto.getC_number());
			json2.put("date_time", dto.getDate_time());
			json2.put("file_name", dto.getFile_name());
			json2.put("warning", dto.getWarning());
			jarray.add(json2);
		}
		json.put("review", jarray);
		out.print(json.toString());
	}

}
