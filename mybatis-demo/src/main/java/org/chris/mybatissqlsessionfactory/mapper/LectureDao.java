package org.chris.mybatissqlsessionfactory.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatissqlsessionfactory.entity.Lecture;
@Mapper
public interface LectureDao {

    Lecture getLecture(Integer id);
}
