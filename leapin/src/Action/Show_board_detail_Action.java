package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import DAO.Board_DAO;
import DAO.LeapinDAO;
import DTO.Board_DTO;
import DTO.Reply_DTO;

public class Show_board_detail_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset = utf-8");
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		PrintWriter out = response.getWriter();
		int bno = Integer.parseInt(request.getParameter("bno"));
		Board_DAO ba = new Board_DAO();
		Board_DTO bd = new Board_DTO();
		LeapinDAO ld = new LeapinDAO();
		int count = 0;
		ArrayList<Reply_DTO> rarray = new ArrayList<>();
		ba.select_board(bno, bd);
		ba.select_board_reply(bno, rarray);
		json.put("title", bd.getTitle());
		json.put("writer_name", ld.receive_name(bd.getWriter()));
		json.put("writer", bd.getWriter());
		json.put("content", bd.getContent());
		json.put("hitcount", bd.getHitcount());
		json.put("recommend", bd.getRecommend());
		json.put("warning", bd.getWarning());
		json.put("date_time", bd.getDate_time());
		json.put("file_name", bd.getFile_name());
		for(Reply_DTO rd : rarray) {
			JSONObject o = new JSONObject();
			o.put("writer", rd.getWriter());
			o.put("date_time", rd.getDate_time());
			o.put("r_number", rd.getR_number());
			o.put("warning", rd.getWarning());
			o.put("content", rd.getContent());
			jarray.add(o);
			count++;
		};
		json.put("reply", jarray);
		json.put("count", count);
		out.print(json.toString());
		
		
		

	}

}
