package org.chris.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatis.entity.StudentHealthFemale;
@Mapper
public interface StudentHealthFemaleDao {

    StudentHealthFemale findStudentHealthFemaleByStudentId(Integer id);
}
