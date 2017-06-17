package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.PageBean;
import com.entity.TGrade;
import com.service.GradeService;
import com.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("grade")
public class GradeController {

	@Autowired
	private GradeService service;
	
	@RequestMapping("list")
	public String list(String page,String rows,TGrade grade,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		int start=pageBean.getStart();
		int size=pageBean.getPageSize();
		List<TGrade> gradeList=null;
		if(grade.getFinalgrade() != null )
			gradeList=service.findGradesByFinal(grade.getFinalgrade(), start, size);
		/*if(grade.getTStudent().getStudentName() != null)
			gradeList=service.findGradesByName(grade.getTStudent().getStudentName(), start, size);*/
		gradeList=service.findGrades(start, size);
		JsonConfig config=new JsonConfig();
		config.setExcludes(new String[]{"TStudent","TCourse"});
		JSONArray jsonArray=JSONArray.fromObject(gradeList,config);
		JSONObject result=new JSONObject();
		int total=service.getTotal(start, size);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("save")
	public String save(TGrade grade,HttpServletResponse response)throws Exception{
		if(grade.getId() == null)
			service.add(grade);
		else
			service.update(grade);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("delete")
	public String delete(String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++)
			service.delete(Integer.parseInt(idsStr[i]));
		JSONObject result=new JSONObject();
		result.put("success",true);
		ResponseUtil.write(response, result);
		return null;
	}
	
}
