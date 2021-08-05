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
import DTO.Chatting_DTO;

public class chat_log_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Chatting_DTO> carray = new ArrayList<Chatting_DTO>();
		ArrayList<String> mname = new ArrayList<String>();
		ArrayList<String> uname = new ArrayList<String>();
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		Chat_DAO ca = new Chat_DAO();
		String id = request.getParameter("id");
		int ono = Integer.parseInt(request.getParameter("ono"));
		
		ca.chat_log(carray,ono,mname,uname);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		int i = 0;
		for(Chatting_DTO cd :carray) {
			JSONObject o = new JSONObject();
			o.put("cno", cd.getCno());
			o.put("output_id", cd.getOutput_id());
			o.put("input_id", cd.getInput_id());
			o.put("content", cd.getContent());
			o.put("date_time", cd.getDate_time());
			o.put("file_name", cd.getFile_name());
			o.put("ono", cd.getOno());
			o.put("output_name",uname.get(i));
			o.put("input_name", mname.get(i));
			jarray.add(o);	
			i++;
		}
		json.put("dbdata", jarray);
		if(ca.check_request( id, ono)) {
			json.put("e_name",ca.get_e_name(ono));
		}
		out.print(json.toString());
	}

}
