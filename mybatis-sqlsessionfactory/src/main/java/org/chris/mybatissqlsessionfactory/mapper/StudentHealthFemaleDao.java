package org.chris.mybatissqlsessionfactory.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatissqlsessionfactory.entity.StudentHealthFemale;
@Mapper
public interface StudentHealthFemaleDao {

    StudentHealthFemale findStudentHealthFemaleByStudentId(Integer id);
}
