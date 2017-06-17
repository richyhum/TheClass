package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.PageBean;
import com.entity.TStudent;
import com.service.StudentService;
import com.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@Controller
@RequestMapping("student")
public class StudentController {
	
	@Autowired
	private StudentService service;
	
	@RequestMapping("validate")
	public String validate(TStudent student,HttpServletRequest request)throws Exception{
		TStudent resultStudent=service.valildate(student);
		if(resultStudent == null){
			request.setAttribute("student", student);
			request.setAttribute("errMessage", "用户名或密码错误");
			return "backtage/login";
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("currentStudent", resultStudent);
			return "redirect:/backtage/main.jsp";
		}
	}
	@RequestMapping("list")
	public String list(String page,String rows,TStudent student,HttpServletResponse response)throws Exception{
		/*PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("studentName",StringUtil.formatLike(student.getStudentName()));
		map.put("student_no",StringUtil.formatLike(student.getStudentNo()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<TStudent> stuList=service.findStudents(map);
		Integer total=service.getTotalStudents(map);
		JSONArray jsonArray=JSONArray.fromObject(stuList);
		JSONObject result=new JSONObject();
		result.put("total", total);
		result.put("rows", jsonArray);
		ResponseUtil.write(response, result);*/
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		int start=pageBean.getStart();
		int size=pageBean.getPageSize();
		List<TStudent> stuList=null;
		if(student.getStudentName() == null && student.getStudentNo() == null)
			stuList=service.findStudents(start, size);
		if(student.getStudentName()!=null && student.getStudentNo() == null)
			stuList=service.findStudentsByName(student.getStudentName(), start, size);
		if(student.getStudentNo()!=null && student.getStudentName() == null)
			stuList=service.findStudentsByName(student.getStudentNo(), start, size);
		Integer total=service.getTotalStudents(start,size);
		JsonConfig jsonConfig=new JsonConfig();
		//去除级联属性（有关联关系的就算是级联属性）
		jsonConfig.setExcludes(new String[]{"TClass","TWorkses","TGrades"});
		JSONArray jsonArray=JSONArray.fromObject(stuList,jsonConfig);
		JSONObject result=new JSONObject();
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("save")
	public String save(TStudent student,HttpServletResponse response)throws Exception{
		if(student.getId() == null)
			service.addStudent(student);
		else
			service.updateStudent(student);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("delete")
	public String delete(String ids,HttpServletResponse response)throws Exception{
		String [] idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			service.deleteStudent(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("modifyPassword")
	public String modifyPassword(TStudent student,HttpServletResponse response)throws Exception{
		service.updateStudent(student);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	//注销
	@RequestMapping("logout")
	public String logout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/backtage/login.jsp";
	}

}
