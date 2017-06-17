package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TCourse;

@Repository
public class CourseDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void add(TCourse course){
		getSession().save(course);
	}
	public void update(TCourse course){
		getSession().update(course);
	}
	public void delete(Integer ids){
		getSession().delete(ids);
	}
	public Integer getTotal(){
		return getSession().createQuery("from TCourse").list().size();
	}
	public List<TCourse> findCourses(int start,int size){
		return getSession().createQuery("from TCourse").setFirstResult(start).setMaxResults(size).list();
	}
	//模糊查询   根据课程名字查找
	public List<TCourse> findCoursesByName(String name,int start,int size){
		return getSession().createQuery("from TCourse WHERE courseName LIKE ?")
				.setParameter(0, name)
				.setFirstResult(start).setMaxResults(size).list();
	}
	//根据授课老师名字查找     （初步 没有写好 包括此项目的所有有关联关系的）
	public List<TCourse> findCoursesByTeachers(String name,int start,int size){
		return getSession().createQuery("from TCourse WHERE teacherName LIKE ?")
				.setParameter(0, name)
				.setFirstResult(start).setMaxResults(size).list();
	}
}
