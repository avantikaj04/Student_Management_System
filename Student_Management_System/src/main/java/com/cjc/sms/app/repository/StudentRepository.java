package com.cjc.sms.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cjc.sms.app.model.Student;
import java.util.List;


@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{

	public List<Student>  findByBatchNumber(String batchNumber);
}
