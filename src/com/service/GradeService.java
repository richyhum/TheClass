package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GradeDao;
import com.entity.TGrade;

@Service
public class GradeService {

	@Autowired
	private GradeDao dao;
	
	public void add(TGrade grade){
		dao.add(grade);
	}
	public void update(TGrade grade){
		dao.update(grade);
	}
	public void delete(Integer ids){
		dao.delete(ids);
	}
	public List<TGrade> findGrades (int start,int size){
		return dao.findGrades(start, size);
	}
	public List<TGrade> findGradesByFinal(Double finalgrade,int start,int size){
		return dao.findGradesByfinal(finalgrade, start, size);
	}
	public List<TGrade> findGradesByName(String studentName,int start,int size){
		return dao.findGradeByName(studentName, start, size);
	}
	public Integer getTotal(int start,int size){
		return dao.getTotal(start,size);
	}
}
