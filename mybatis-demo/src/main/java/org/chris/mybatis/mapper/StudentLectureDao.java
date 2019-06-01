package org.chris.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatis.entity.StudentLecture;

import java.util.List;
@Mapper
public interface StudentLectureDao {
    List<StudentLecture> findStudentLectureByStudentId(Integer id);
}