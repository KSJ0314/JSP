package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {

	public static MultipartRequest uploadFile(HttpServletRequest request, String saveDirectory, int maxPostSize) {
		
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");
		} catch (Exception e) {
			System.out.println("uploadFile() 실패");
			e.printStackTrace();
		}
		
		return mr;
	}
	
	public static void download(HttpServletRequest request, HttpServletResponse response, String saveDirectory, String ofile, String sfile) {
		String sd = request.getServletContext().getRealPath(saveDirectory);
		try {
			File file = new File(sd, sfile);
			InputStream inStream = new FileInputStream(file);
			
			ofile = new String(ofile.getBytes("utf-8"), "ISO-8859-1");
			
			// 응답 헤더 초기화
			response.reset();
			
			// 8비트 스트림 설정
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\""+ofile+"\"");
			response.setHeader("Content-Length", ""+file.length());
			
			OutputStream outStream = response.getOutputStream();
			byte[] b = new byte[(int)file.length()];
			int readBuffer = 0;
			while((readBuffer = inStream.read(b))>0){
				outStream.write(b, 0, readBuffer);
			}
			
			inStream.close();
			outStream.close();
			
		} catch (Exception e) {
			System.out.println("download() 실패");
			e.printStackTrace();
		}
	}
	public static void deleteFile(HttpServletRequest request, String saveDirectory, String sfile) {
		String sd = request.getServletContext().getRealPath(saveDirectory);
		File file = new File(sd + File.separator + sfile);
		if(file.exists()) {
			file.delete();
		}
		
	}
	
}
