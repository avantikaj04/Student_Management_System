package com.cjc.sms.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.cjc.sms.app.model.Student;
import com.cjc.sms.app.repository.StudentRepository;

@Service
public class StudentService implements StudentServiceInt 
{
	@Autowired
	StudentRepository sr;

	@Override
	public void addStudent(Student student)
	{
		sr.save(student);
	}

	@Override
	public List<Student> getAllStudents() {
		// TODO Auto-generated method stub
		return sr.findAll();
	}

	@Override
	public List<Student> removeStudent(int id) 
	{
		sr.deleteById(id);
		
		List<Student> list= sr.findAll();


		return list;
	}

	@Override
	public List<Student> searchByBatchNumber(String batchNumber)
	{
		List<Student> list= sr.findByBatchNumber(batchNumber);
		
		return list;
	}

	@Override
	public List<Student> paggination(int pageno, int pageSize)
	{
		List<Student> list= sr.findAll(PageRequest.of(pageno, pageSize)).getContent();
		return list;
	}

	@Override
	public Student updateFees(int id) 
	{
		
		return sr.findById(id).get();
	}

	@Override
	public void saveUpdatedFees(int studentID, float ammount)
	{
		Student s= sr.findById(studentID).get();
		s.setFeesPaid(s.getFeesPaid()+ammount);
		sr.save(s);
		
		
	}

	@Override
	public Student shiftingBatch(int id)
	{
		
		return sr.findById(id).get();
	}

	@Override
	public void saveBatch(int studentID, String batchNumber)
	{
		
		Student s= sr.findById(studentID).get();
		s.setBatchNumber(batchNumber);
		sr.save(s);
	}

	
}
