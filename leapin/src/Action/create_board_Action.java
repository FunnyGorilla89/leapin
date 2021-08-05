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
import DTO.Board_DTO;

public class create_board_Action implements Action {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setContentType("application/json; charset = utf-8");
				System.out.println("create_board open");
				JSONObject json = new JSONObject();
				JSONArray jarray = new JSONArray();
				PrintWriter out = response.getWriter();
				String sel1 = request.getParameter("sel1");
				String sel2 = request.getParameter("sel2");
				String search_val = request.getParameter("search_val");
				String pageNum = request.getParameter("pageNum");
				if(pageNum == null || pageNum.equals("null")) {
					pageNum = "1";
				}
				
				if(sel1 == null || sel1.equals("null")) {
					sel1 = "bno";
				}
				if(sel2 == null || sel2.equals("null")) {
					sel2 = "writer";
				}
				if(search_val == null || search_val.equals("null")) {
					search_val = "%%";
				}
				Board_DAO ba = new Board_DAO();
				ArrayList<Board_DTO> barray = new ArrayList<>();
				int currentPage = Integer.parseInt(pageNum);
		    	int pageSize = 10;
		    	int startRow = (currentPage - 1)*pageSize +1;
		    	int endRow = currentPage * pageSize;
		    	System.out.println("startRow : " + startRow);
		    	System.out.println("endRow : " + endRow);
		    	System.out.println("sel1 : " + sel1);
		    	System.out.println("sel2 : " + sel2);
		    	System.out.println("search_val : " + search_val);
		    	System.out.println("pageNum : " + pageNum);
				ba.create_board(startRow, endRow, sel1, sel2, search_val, barray);
				for(Board_DTO b : barray) {
					JSONObject o = new JSONObject();
					o.put("bno", b.getBno());
					o.put("title", b.getTitle());
					o.put("writer", b.getWriter());
					o.put("content", b.getContent());
					o.put("hitcount", b.getHitcount());
					o.put("recommend", b.getRecommend());
					o.put("warning", b.getWarning());
					o.put("date_time", b.getDate_time());
					o.put("file_name", b.getFile_name());
					jarray.add(o);
				}
				
			
			
		    	 json.put("dbdata", jarray);
		    	 int count = ba.getBoardCount(sel2, search_val);
		    	 JSONArray jarray2 = new JSONArray();
		    	  	if(count > 0){
		    	  		// 총페이지 수
		    	  		int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
		    	  						//전체 컬럼수 / 한페이지에 보여줄 컬럼수 +(전체컬럼수 / 한페이지에 보여줄 컬럼수)의 나머지가 0이면 0 아니라면 1
		    	  		int pageBlock = 5;	//한페이지에 보여줄 블럭 수
		    	  		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		    	  						//((현재페이지 -1)/한페이지에 보여줄 블럭 수) * 한페이지에 보여줄 블럭 수 +1;
		    	  						//1~5 페이지 같은경우엔 startPage가 1, 6~10 페이지는 2 11~15페이지는 11이 된다
		    	  		int endPage = startPage + pageBlock - 1;
		    	  						//시작페이지 + 한페이지에 보여줄 블럭 수 -1
		    	  						// 1~5페이지 같은경우엔 endPage가 6, 6~10 페이지는 10 11~15페이지는 15가 된다
		    	  		if(endPage > pageCount){ // 마지막 페이지의 수가 총 페이지의 수보다 크다면 마지막페이지를 총페이지의 수로 할당
		    				endPage = pageCount;
		    			};
		    	  		if(startPage > pageBlock){ // startPage가 한페이지에 보여줄 블럭 수 보다 크다면 [이전] 링크를 생성(파라미터값 (보여지는첫번째페이지번호 - 한번에보여줄페이지수)를 보낸다)   	  			
		    	  			json.put("prePage", "<li class='page-item'><a class='page-link' href='http://localhost:9090/Projectweb1/Ex501_board_list.jsp?pageNum='" + (startPage - 5)+ "'>이전</a></li>");
		    	  		};
		    	  		for(int i = startPage; i <= endPage; i++){
		    	  			JSONObject o = new JSONObject();
		    	  			if(i == currentPage){ // i 가 현재페이지라면 링크를 생성하지 않음.
		    	  			o.put("pagination", "<li class='page-item'><span class = 'page-link'>"+i+"</span></li>");		  				  	  					  				
		    	  			}else{ // i가 현재페이지가 아닐 때 링크를 생성 (파라미터값으로 선택한 페이지의 번호를 보낸다.)
		    	  			o.put("pagination", "<li class='page-item'><a class='page-link' href='http://localhost:9090/Projectweb1/Ex501_board_list.jsp?pageNum=" + i + "'>" + i + "</a></li>");  	  			
		    	  			};
		    	  			jarray2.add(o);
		    	  		};
		    	  		json.put("pagination", jarray2);
		    	  		if(endPage < pageCount){ // endpage가 총페이지수보다 작다면 [다음] 링크를 생성 (파라미터값 (보여지는마지막페이지번호 + 한번에보여줄페이지수)를 보낸다 )  	  			
		    	  			json.put("nextPage", "<li class='page-item'><a class='page-link' href='http://localhost:9090/Projectweb1/Ex501_board_list.jsp?pageNum=" + (startPage + 5) + "'>다음</a></li>");   	    	  	  
		    	  		};
		    	  	};
		    	  
		    	  	out.print(json.toString());
		    	 
			}

		


	}


