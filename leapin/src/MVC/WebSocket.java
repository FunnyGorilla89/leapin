package MVC;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import DAO.Chat_DAO;

@ServerEndpoint(value = "/echo/{ono}",configurator = GetHttpSession.class // name은 채팅참여 유저이름
)
public class WebSocket {
	
	private static List<String> onolist = new ArrayList<>();
	private static ConcurrentHashMap<Session,HttpSession> userList = new ConcurrentHashMap<>();
	private static Chat_DAO cd = new Chat_DAO();
	// 클라이언트와 연결된 이후 호출되는 메소드
	@OnOpen
	public void onOpen(Session session,EndpointConfig config ,@PathParam("ono") String ono) throws IOException {
	    System.out.println(  "(" + session.getId() + ")님이 접속했습니다.");
	   	
		HttpSession httpSession = (HttpSession)config.getUserProperties().get("HTTP_SESSION");
		session.getUserProperties().put("ono", ono);
		System.out.println("HTTP세션ID :" + httpSession.getId() + "견적서 번호" + ono);
		for(int i = 0; i < onolist.size(); i++) {
			if(!onolist.get(i).equals(ono)) {
				System.out.println("여기");
				onolist.add(ono);
			}
		}
		userList.put(session, httpSession);
	}
	
	// 서버가 클라이언트로부터 메시지를 받았을때 호출되는 메소드
	@OnMessage
	public void onMessage(Session session, String message, @PathParam("ono") String ono) throws IOException {		
		System.out.println(ono);	 
	    System.out.println(message);	 
	    Session s = session;
	    String[] marray = new String[3];
	    marray = message.split("/");
	    String content = marray[0];
	    String output_id = marray[1];
	    String input_id = marray[2];
	    String file_name = marray[3];
	   int ono1 = Integer.parseInt(ono);
	    System.out.println(content+"/"+output_id + "/" + input_id + "/" + file_name);
	    cd.insert_Message_content(input_id, output_id, ono1, content,file_name);
	    System.out.println(userList.size());
	    for(Map.Entry<Session,HttpSession> entry : userList.entrySet()) {
	    	Session target = entry.getKey();
	    	if(!(target.getId().equals(s.getId())) && target.isOpen() && s.getUserProperties().get("ono").equals(target.getUserProperties().get("ono"))) {
	    		target.getBasicRemote().sendText(message);
	    		System.out.println("message : " + message);
	    		System.out.println("session_id : " + target.getId());
	    	}
	    	
	    }
		
	}
	
	// 클라이언트와 연결이 끊어졌을때 호출되는 메소드
	@OnClose
	public void onClose(Session session) throws IOException {
		System.out.println("removeSession : " + session);
	  userList.remove(session);
	}
	
	@OnError
	public void onError(Session session, Throwable throwable) {
		// Do error handling here
	}
	
	
	}
