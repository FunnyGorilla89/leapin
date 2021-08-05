package MVC;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/upload")
public class upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public upload() {

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8;");
		System.out.println(response.getContentType());
		PrintWriter out = response.getWriter();
		String directory = this.getServletContext().getRealPath("/upload/");
		
		System.out.println(directory);
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		System.out.println("-----------------------------------------------");
		System.out.println("request");
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multipartRequest
		= new MultipartRequest(request,directory,maxSize,encoding,policy);
		System.out.println("multipartRequest : "+multipartRequest);
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		System.out.println("fileName : " +fileName);
		System.out.println("fileRealName : " +fileRealName);
		out.print(fileRealName);
	}

}
