package MVC;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class downloadAction
 */
@WebServlet("/downloadAction")
public class downloadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fileName = request.getParameter("file");
		String directory = this.getServletContext().getRealPath("/upload/");
		System.out.println(fileName);
		File file = new File(directory + "/" + fileName);
		String mimeType = getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		
		String downloadName = null;
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		}else {
			downloadName = URLEncoder.encode(fileName,"EUC-KR").replaceAll("\\+", "%20");						
		}
			response.setHeader("content-Disposition", "attachment;filename=\""
					+ downloadName + "\";");
			System.out.println(file);
			FileInputStream fi = new FileInputStream(file);
			ServletOutputStream so = response.getOutputStream();
			
			byte b[] = new byte[1024];
			int data = 0;
			
			while((data=(fi.read(b,0,b.length))) != -1) {
				so.write(b,0,data);
			}
			so.flush();
			so.close();
			fi.close();
		
	}

	

}
