package com.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.TStudent;

@Repository
public class StudentDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	//登录验证֤
	public TStudent validate(TStudent stu){
		Query query=getSession().createQuery("select student from TStudent student where student.studentName=? and student.password=?");
		query.setParameter(0, stu.getStudentName());
		query.setParameter(1, stu.getPassword());
		TStudent student=(TStudent)query.uniqueResult();
		return student;
	}
	//CUD
	public void addTStudent(TStudent TStudent){
		getSession().save(TStudent);
	}
	public void updateTStudent(TStudent TStudent){
		getSession().update(TStudent);
	}
	public void deleteTStudent(Integer ids){
		TStudent TStudent=(TStudent)getSession().get(TStudent.class, ids);
		getSession().delete(TStudent);
	}
	/*//Retrieve
	public List<TStudent> findStudents(TStudent student,int page,int rows){
		return getSession().createQuery("from TStudent where studentName like ? and student_no like ?")
				.setParameter(0,"%"+student.getStudentName()+"%")
				.setParameter(1,"%"+student.getStudentNo()+"%")
				.setFirstResult(page).setMaxResults(rows).list();
	}*/
	/**
	 * 全部查询   模糊查询*/
	//Retrieve
		public List<TStudent> findStudents(int page,int rows){
			return getSession().createQuery("from TStudent").setFirstResult(page).setMaxResults(rows).list();
		}
	//Retrieve
	public List<TStudent> findStudentsByName(String searchName,int page,int rows){
		return getSession().createQuery("from TStudent where studentName like ?").setParameter(0, searchName)
				.setFirstResult(page).setMaxResults(rows).list();
	}	
	//Retrieve
	public List<TStudent> findStudentsByNo(String student_no,int page,int rows){
		return getSession().createQuery("from TStudent where student_no like ?").setParameter(0, student_no)
				.setFirstResult(page).setMaxResults(rows).list();
	}
	//Retrieve
	/*public List<TStudent> findStudents(Map<String,Object> map){
		return getSession().createQuery("from TStudent where studentName like ? and student_no like ?")
				.setParameter(0,map.get("studentName")).setParameter(1,map.get("student_no"))
				.setFirstResult(Integer.parseInt(String.valueOf(map.get("start"))))
				.setMaxResults(Integer.parseInt(String.valueOf(map.get("size"))))
				.list();
	}*/
	public Integer getTotalTStudents(int page,int rows){
		return getSession().createQuery("from TStudent").list().size();
	}
}
