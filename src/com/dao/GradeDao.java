package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TGrade;

@Repository
public class GradeDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	//CUD
	public void add(TGrade grade){
		getSession().save(grade);
	}
	public void update(TGrade grade){
		getSession().update(grade);
	}
	public void delete(Integer ids){
		getSession().delete(ids);
	}
	//Retreive
	public List<TGrade> findGrades(int start,int size){
		return getSession().createQuery("from TGrade").list();
	}
	public List<TGrade> findGradesByfinal(Double finalgrade,int start,int size){
		return getSession().createQuery("from TGrade where finalgrade like ?").setParameter(0,finalgrade).list();
	}
	//根据学生姓名查询成绩
	public List<TGrade> findGradeByName(String studentName,int start,int size){
		return getSession().createQuery("from TGrade where studentName like ?").setParameter(0, studentName).list();
	}
	public Integer getTotal(int start,int size){
		return getSession().createQuery("from TGrade").list().size();
	}
}
