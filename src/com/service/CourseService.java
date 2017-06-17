package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CourseDao;
import com.entity.TCourse;

@Service
public class CourseService {
	
	@Autowired
	private CourseDao dao;
	
	public void add(TCourse course){
		dao.add(course);
	}
	public void update(TCourse course){
		dao.update(course);
	}
	public void delete(Integer ids){
		dao.delete(ids);
	}
	public Integer getTotal(int start,int size){
		return dao.getTotal();
	}
	public List<TCourse> findCourses(int start,int size){
		return dao.findCourses(start, size);
	}
	public List<TCourse> findCoursesByName(String name,int start,int size){
		return dao.findCoursesByName(name, start, size);
	}
	public List<TCourse> findCoursesByTeachers(String name,int start,int size){
		return dao.findCoursesByTeachers(name, start, size);
	}

}
