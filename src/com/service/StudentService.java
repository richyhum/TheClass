package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.StudentDao;
import com.entity.TStudent;

@Service
public class StudentService {

	@Autowired
	private StudentDao dao;
	
	public TStudent valildate(TStudent TStudent)throws Exception{
		return dao.validate(TStudent);
	}
	public void addStudent(TStudent TTStudent)throws Exception{
		 dao.addTStudent(TTStudent);
	}
	public void updateStudent(TStudent TStudent)throws Exception{
		dao.updateTStudent(TStudent);
	}
	public void deleteStudent(Integer ids)throws Exception{
		dao.deleteTStudent(ids);
	}
	/*public List<TStudent> findStudents(String sql,int page,int rows)throws Exception{
		return dao.findTStudents(sql,page,rows);
	}*/
	public List<TStudent> findStudentsByName (String studentName,int page,int rows){
		return dao.findStudentsByName(studentName, page, rows);
	}
	public List<TStudent> findStudentsByNo(String student_no,int page,int rows){
		return dao.findStudentsByNo(student_no, page, rows);
	}
	public List<TStudent> findStudents(int page,int rows){
		return dao.findStudents(page,rows);
	}
	public Integer getTotalStudents(int page,int rows)throws Exception{
		return dao.getTotalTStudents(page,rows);
	}
}
