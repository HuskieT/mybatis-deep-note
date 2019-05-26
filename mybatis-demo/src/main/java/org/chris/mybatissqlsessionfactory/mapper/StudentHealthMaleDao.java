package org.chris.mybatissqlsessionfactory.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatissqlsessionfactory.entity.StudentHealthMale;
@Mapper
public interface StudentHealthMaleDao {

    StudentHealthMale findStudentHealthMaleByStudentId(Integer id);
}
