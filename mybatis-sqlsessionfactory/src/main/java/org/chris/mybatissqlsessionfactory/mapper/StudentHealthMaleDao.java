package org.chris.mybatissqlsessionfactory.mapper;


import org.chris.mybatissqlsessionfactory.entity.StudentHealthMale;

public interface StudentHealthMaleDao {

    StudentHealthMale findStudentHealthMaleByStudentId(Integer id);
}
