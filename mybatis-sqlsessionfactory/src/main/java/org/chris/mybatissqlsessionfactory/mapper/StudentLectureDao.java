package org.chris.mybatissqlsessionfactory.mapper;


import org.chris.mybatissqlsessionfactory.entity.StudentLecture;

import java.util.List;

public interface StudentLectureDao {
    List<StudentLecture> findStudentLectureByStudentId(Integer id);
}