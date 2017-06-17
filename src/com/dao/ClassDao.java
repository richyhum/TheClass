package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TClass;

@Repository
public class ClassDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	//CUD
	public void add(TClass stuClass){
		getSession().save(stuClass);
	}
	public void update(TClass stuClass){
		getSession().update(stuClass);
	}
	public void delete(Integer ids){
		getSession().delete(ids);
	}
	//Retreive
	public List<TClass> findClasses(int start,int size){
		return getSession().createQuery("from TClass").list();
	}
	public Integer getTotal(int page,int size){
		return getSession().createQuery("from TClass").list().size();
	}
	
}
