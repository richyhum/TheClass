package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TeacherDao;
import com.entity.TTeacher;

@Service
public class TeacherService {

	@Autowired
	private TeacherDao dao;
	
	public void add(TTeacher tea){
		 dao.add(tea);
	}
	public void update (TTeacher tea){
		dao.add(tea);
	}
	public void delete(Integer ids){
		dao.delete(ids);
	}
	public List<TTeacher> findTeachers(int start,int size){
		return dao.findTeachers( start, size);
	}
	public Integer getTotal(int start,int size){
		return dao.getTotal(start, size);
	}
}
