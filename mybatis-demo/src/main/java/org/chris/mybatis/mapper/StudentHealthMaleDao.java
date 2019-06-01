package org.chris.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatis.entity.StudentHealthMale;
@Mapper
public interface StudentHealthMaleDao {

    StudentHealthMale findStudentHealthMaleByStudentId(Integer id);
}
