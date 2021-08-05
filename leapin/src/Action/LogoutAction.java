package Action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loginId");   // .invalidate() : 세션을 무효화 ----> 세션에 담겨 있는 '로그인 아이디' 정보도 삭제 ----> 결국, 로그아웃 처리가 됨!
		session.removeAttribute("E");   // .invalidate() : 세션을 무효화 ----> 세션에 담겨 있는 '로그인 아이디' 정보도 삭제 ----> 결국, 로그아웃 처리가 됨!
		// 또는 session.removeAttribute("loginId");
		
		RequestDispatcher rd = request.getRequestDispatcher("leapin/Main.jsp");
		rd.forward(request, response);
	}
}
