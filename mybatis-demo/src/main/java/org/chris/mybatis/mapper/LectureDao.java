package org.chris.mybatis.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatis.entity.Lecture;
@Mapper
public interface LectureDao {

    Lecture getLecture(Integer id);
}
