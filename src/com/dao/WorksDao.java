package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TWorks;

@Repository
public class WorksDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	//CUD
	public void add(TWorks works){
		getSession().save(works);
	}
	public void update(TWorks works){
		getSession().update(works);
	}
	public void delete(Integer ids){
		getSession().delete(ids);
	}
	//Retreive
	public List<TWorks> findWorks(int start,int size){
		return getSession().createQuery("from TWorks").list();
	}
	public Integer getTotal(int page,int size){
		return getSession().createQuery("from TWorks").list().size();
	}
	
}
