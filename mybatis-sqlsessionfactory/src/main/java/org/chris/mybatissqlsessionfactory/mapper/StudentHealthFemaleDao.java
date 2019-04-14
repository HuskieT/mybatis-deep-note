package org.chris.mybatissqlsessionfactory.mapper;


import org.chris.mybatissqlsessionfactory.entity.StudentHealthFemale;

public interface StudentHealthFemaleDao {

    StudentHealthFemale findStudentHealthFemaleByStudentId(Integer id);
}
