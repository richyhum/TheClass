package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.WorksDao;
import com.entity.TClass;
import com.entity.TWorks;

@Service
public class WorksService {

	@Autowired
	private WorksDao dao;
	
	public void add(TWorks works){
		 dao.add(works);
	}
	public void update (TWorks works){
		dao.add(works);
	}
	public void delete(Integer ids){
		dao.delete(ids);
	}
	public List<TWorks> findWorks(int start,int size){
		return dao.findWorks( start, size);
	}
	public Integer getTotal(int start,int size){
		return dao.getTotal(start, size);
	}
}
