package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TTeacher;

@Repository
public class TeacherDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	//CUD
	public void add(TTeacher tea){
		getSession().save(tea);
	}
	public void update(TTeacher tea){
		getSession().update(tea);
	}
	public void delete(Integer ids){
		getSession().delete(ids);
	}
	//Retreive
	public List<TTeacher> findTeachers(int start,int size){
		return getSession().createQuery("from TTeacher").list();
	}
	public Integer getTotal(int page,int size){
		return getSession().createQuery("from TTeacher").list().size();
	}
	
}
