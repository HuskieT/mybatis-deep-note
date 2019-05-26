package org.chris.mybatissqlsessionfactory.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatissqlsessionfactory.entity.StudentLecture;

import java.util.List;
@Mapper
public interface StudentLectureDao {
    List<StudentLecture> findStudentLectureByStudentId(Integer id);
}