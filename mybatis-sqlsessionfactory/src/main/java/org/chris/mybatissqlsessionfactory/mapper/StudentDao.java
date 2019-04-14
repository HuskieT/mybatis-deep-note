package org.chris.mybatissqlsessionfactory.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatissqlsessionfactory.entity.Student;


@Mapper
public interface StudentDao {
    Student getStudent(Integer id);
}