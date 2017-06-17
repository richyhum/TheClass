package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ClassDao;
import com.entity.TClass;

@Service
public class ClassService {

	@Autowired
	private ClassDao dao;
	
	public void add(TClass stuClass){
		 dao.add(stuClass);
	}
	public void update (TClass stuClass){
		dao.add(stuClass);
	}
	public void delete(Integer ids){
		dao.delete(ids);
	}
	public List<TClass> findClasses(int start,int size){
		return dao.findClasses( start, size);
	}
	public Integer getTotal(int start,int size){
		return dao.getTotal(start, size);
	}
}
