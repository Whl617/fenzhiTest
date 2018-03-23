package com.imooc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	static List<String> datas=new ArrayList<String>();
	static{
		
		datas.add("ajax");
		datas.add("ajax post");
		datas.add("ajax1");
		datas.add("bom");
		datas.add("cadda");
		datas.add("da");
		datas.add("eegege");
		datas.add("moadfa");
		datas.add("whl");
		datas.add("wp");
		datas.add("wht");
		datas.add("wdf");
		datas.add("sbwp");
		
	}
       
  
 @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得客户端数据
	 response.setCharacterEncoding("utf-8");
	 request.setCharacterEncoding("utf-8");
	 String keyword=request.getParameter("keyword");
	 List<String> data=getdata(keyword);
	 //返回json
	 response.getWriter().write(JSONArray.fromObject(data).toString());
	}

	public List<String> getdata(String keyword)
	{
		List<String> list=new ArrayList<String>();
		for(String data:datas)
		{
			if(data.contains(keyword))
			{
				list.add(data);
			}
		}
		return list;
		
	}
	 

}
