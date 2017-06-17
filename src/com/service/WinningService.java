package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.WinningDao;
import com.entity.TClass;
import com.entity.TWinning;

@Service
public class WinningService {

	@Autowired
	private WinningDao dao;
	
	public void add(TWinning win){
		 dao.add(win);
	}
	public void update (TWinning win){
		dao.update(win);
	}
	public void delete(Integer ids){
		dao.delete(ids);
	}
	public List<TWinning> findWinnigs(int start,int size){
		return dao.findWinnings( start, size);
	}
	public Integer getTotal(int start,int size){
		return dao.getTotal(start, size);
	}
}
