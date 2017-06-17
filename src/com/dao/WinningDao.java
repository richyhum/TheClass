package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TClass;
import com.entity.TWinning;

@Repository
public class WinningDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	//CUD
	public void add(TWinning win){
		getSession().save(win);
	}
	public void update(TWinning win){
		getSession().update(win);
	}
	public void delete(Integer ids){
		getSession().delete(ids);
	}
	//Retreive
	public List<TWinning> findWinnings(int start,int size){
		return getSession().createQuery("from TWinning").list();
	}
	public Integer getTotal(int page,int size){
		return getSession().createQuery("from TWinning").list().size();
	}
	
}
