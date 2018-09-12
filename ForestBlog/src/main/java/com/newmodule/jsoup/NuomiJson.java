package com.newmodule.jsoup;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;

@WebServlet("/NuomiJson")
public class NuomiJson extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public NuomiJson() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "http://dianying.nuomi.com/movie/boxrefresh";
		String json = getJson(url);
		System.out.println("doget:"+json);
		response.setHeader("content-type","text/html;charset=UTF-8");//����
		outPut(response,json);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
	public String getJson(String url) throws IOException {
		String json = Jsoup.connect(url)
				.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0")
				.ignoreContentType(true)
				.timeout(4000)
				.execute()
				.body();
		System.out.println("getjson:"+json);
		return json;
	}
	public static void outPut(HttpServletResponse response,String content) {
		PrintWriter out = null;
		response.setCharacterEncoding("UTF-8");//����.
		response.setHeader("Access-Control-Allow-Origin", "*");//设置了允许跨域访问,还需要在网站根目录下配置一个crossdomain.xml文件
		try {
			out = response.getWriter();
			out.write(content);
			out.flush();
			out.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
