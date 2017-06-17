package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.PageBean;
import com.entity.TClass;
import com.service.ClassService;
import com.util.DateJsonValueProcessor;
import com.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("class")
public class ClassController {

	@Autowired
	private ClassService service;
	
	@RequestMapping("list")
	public String list(String page,String rows,TClass stuClass,HttpServletResponse response)throws Exception{
		PageBean pageBean =new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		int start=pageBean.getStart();
		int size=pageBean.getPageSize();
		List<TClass> classList=service.findClasses(start, size);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"TStudents"});
		config.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy:MM:dd hh:mm:ss"));
		JSONArray jsonArray=JSONArray.fromObject(classList,config);
		JSONObject result=new JSONObject();
		int total=service.getTotal(start, size);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("save")
	public String save(TClass stuClass,HttpServletResponse response)throws Exception{
		if(stuClass.getId() == null)
			service.add(stuClass);
		else
			service.update(stuClass);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("delete")
	public String delete(String ids,HttpServletResponse response)throws Exception{
		String [] idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++)
			service.delete(Integer.parseInt(idsStr[i]));
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
}
