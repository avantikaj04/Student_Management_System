package com.cjc.sms.app.service;

import java.util.List;

import com.cjc.sms.app.model.Student;

public interface StudentServiceInt 
{
	public void addStudent(Student student);
	
	public List<Student> getAllStudents();

	public List<Student> removeStudent(int id);
	
	public List<Student> searchByBatchNumber(String batchNumber);

	public List<Student> paggination(int pageno, int pageSize);

	public Student updateFees(int id);

	public void saveUpdatedFees(int studentID, float ammount);

	public Student shiftingBatch(int id);

	public void saveBatch(int studentID, String batchNumber);

	
	
	
}
