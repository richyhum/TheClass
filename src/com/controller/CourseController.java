package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.PageBean;
import com.entity.TCourse;
import com.service.CourseService;
import com.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("course")
public class CourseController {

	@Autowired
	private CourseService service;
	
	@RequestMapping("list")
	public String list(String page,String rows,TCourse course,HttpServletResponse response)throws Exception{
		PageBean pageBean =new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		int start=pageBean.getStart();
		int size=pageBean.getPageSize();
		List<TCourse> courseList=null;
		if(course.getCourseName() != null)
			courseList=service.findCoursesByName(course.getCourseName(), start, size);
		//存在关联关系问题
		/*if(course.getTTeacher().getTeacherName() != null)
			courseList=service.findCoursesByTeachers(course.getTTeacher().getTeacherName(), start, size);*/
		courseList=service.findCourses(start, size);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"TTeacher","TGrades"});
		JSONArray jsonArray=JSONArray.fromObject(courseList,config);
		int total=service.getTotal(start, size);
		JSONObject result=new JSONObject();
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("save")
	public String save(TCourse course,HttpServletResponse response)throws Exception{
		if(course.getId() == null)
			service.add(course);
		else
			service.update(course);
		JSONObject result=new JSONObject();
		result.put("success", result);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("delete")
	public String delete(String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++)
			service.delete(Integer.parseInt(idsStr[i]));	
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
}
