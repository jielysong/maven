package com.yx.app.admin.common.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public class ResposeUtil {
	
	public static void output(HttpServletResponse response, String outString) throws IOException {

		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "No-cache");
		response.getWriter().print(outString);// 鍐欏埌瀹㈡埛绔�

	}
	
	public static void outputJSON(HttpServletResponse response, String outString) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "No-cache");
		response.getWriter().print(outString);// 鍐欏埌瀹㈡埛绔�
		response.getWriter().flush();

	}
}
