package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.PageBean;
import com.entity.TClass;
import com.entity.TWorks;
import com.service.ClassService;
import com.service.WorksService;
import com.util.DateJsonValueProcessor;
import com.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("works")
public class WorksController {

	@Autowired
	private WorksService service;
	
	@RequestMapping("list")
	public String list(String page,String rows,TWorks works,HttpServletResponse response)throws Exception{
		PageBean pageBean =new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		int start=pageBean.getStart();
		int size=pageBean.getPageSize();
		List<TWorks> worksList=service.findWorks(start, size);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"TStudent"});
		config.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy:MM:dd hh:mm:ss"));
		JSONArray jsonArray=JSONArray.fromObject(worksList,config);
		JSONObject result=new JSONObject();
		int total=service.getTotal(start, size);
		result.put("rows", jsonArray);
		result.put("total",total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("save")
	public String save(TWorks works,HttpServletResponse response)throws Exception{
		if(works.getId() == null)
			service.add(works);
		else
			service.update(works);
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
