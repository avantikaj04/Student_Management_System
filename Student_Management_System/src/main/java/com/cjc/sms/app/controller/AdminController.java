package com.cjc.sms.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjc.sms.app.model.Student;
import com.cjc.sms.app.service.StudentServiceInt;


@Controller
public class AdminController 
{
	@Autowired
	StudentServiceInt ssi;
	
	
	
	@RequestMapping("/")
	public String preLogin()
	{
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam("username")String username,@RequestParam("password")String password,Model m)
	{
		if(username.equals("admin") && password.equals("admin"))
		{
			List<Student> list= ssi.paggination(0, 2);
			m.addAttribute("data", list);
		return "adminscreen";
		}
		else 
		{
			m.addAttribute("login_fail", "Enter valid login details");
		
			return "login";
		}
	}
	
	@RequestMapping("/enroll_student")
	public String addStudent(@ModelAttribute Student student,Model m)
	{
		
		ssi.addStudent(student);
		
		List<Student> list = ssi.getAllStudents();
		
		m.addAttribute("data", list);
		return "adminscreen";
	}
	
	@RequestMapping("/delete")
	public String deleteStudent(@RequestParam("id")int id,Model m)
	{
		ssi.removeStudent(id);
		
		List<Student> list= ssi.getAllStudents();
		m.addAttribute("data", list);
		
		return "adminscreen";
		
	}
	
	@RequestMapping("/search")
	public String searchByBatchStudent(@RequestParam("batchNumber")String batchNumber,Model m)
	{
		List<Student> list= ssi.searchByBatchNumber(batchNumber);
		if(list.size()>0) 
		{
			
		m.addAttribute("data", list);
		
		}
		else 
		{
			List<Student> list1= ssi.getAllStudents();
			m.addAttribute("data", list1);
			m.addAttribute("message", "No records available "+batchNumber);
			
		}
		
		
		return "adminscreen";
	}
	
	@RequestMapping("/pagging")
	public String pagination(@RequestParam("pageno")int pageno,Model m)
	{
		int pageSize=2;
		List<Student> list= ssi.paggination(pageno,pageSize);
		
		m.addAttribute("data", list);
		
		return "adminscreen";
	}
	
	@RequestMapping("/fees")
	public String payFee(@RequestParam("id")int id,Model m)
	{
		Student st= ssi.updateFees(id);
		m.addAttribute("st", st);
		
		return "fees";
	}
	
	@RequestMapping("/payfees")
	public String editedFee(@RequestParam("studentID")int studentID,@RequestParam("ammount")float ammount,Model m)
	{
		 ssi.saveUpdatedFees(studentID,ammount);
		 
		 List<Student> list=ssi.getAllStudents();
		 
		 m.addAttribute("data", list);
		
		return "adminscreen";
	}
	
	@RequestMapping("/shift")
	public String shiftBatch(@RequestParam("id")int id,Model m)
	{
		Student st= ssi.shiftingBatch(id);
		
		m.addAttribute("st", st);
		
		return "shiftbatch";
	}
	
	@RequestMapping("/changeBatch")
	public String batchShifted(@RequestParam("studentID")int studentID,@RequestParam("batchNumber")String batchNumber,Model m)
	{
		ssi.saveBatch(studentID,batchNumber);
		
		List<Student> list= ssi.getAllStudents();
		
		m.addAttribute("data", list);
		
		return "adminscreen";
	}
	
	@RequestMapping("admin")
	public String admin()
	{
		return "admin";
	}
	
	
	
	
	
	
	
	
	

}
