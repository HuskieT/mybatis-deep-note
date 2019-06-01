package org.chris.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatis.entity.Student;

import java.util.List;


@Mapper
public interface StudentDao {
    Student getStudent(Integer id);
    List<Student> findAllStudent();
}