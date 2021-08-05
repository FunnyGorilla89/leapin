package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import DAO.Chat_DAO;
import DTO.Chat_main_DTO;;

public class chat_main_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset = utf-8");
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		Chat_DAO cd = new Chat_DAO();
		ArrayList<Chat_main_DTO> carray = new ArrayList<>();
		ArrayList<Chat_main_DTO> carray2 = new ArrayList<>();

		cd.get_Chat_info(id, carray);
		cd.get_Chat_info2(id, carray2);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for(Chat_main_DTO cmd : carray) {
			JSONObject o = new JSONObject();
			o.put("ono", cmd.getOno());
			o.put("e_name", cmd.getE_name());
			o.put("content", cmd.getContent());
			o.put("file_name", cmd.getFile_name());
			o.put("date_time", cmd.getDate_time());
			jarray.add(o);
		}
		JSONArray jarray2 = new JSONArray();
		for(Chat_main_DTO cmd : carray2) {
			JSONObject o = new JSONObject();
			o.put("ono", cmd.getOno());
			o.put("e_name", cmd.getE_name());
			o.put("content", cmd.getContent());
			o.put("date_time", cmd.getDate_time());
			jarray2.add(o);
		}
		
		json.put("dbdata", jarray);
		json.put("dbdata2", jarray2);
		out.print(json.toString());
	}

}
