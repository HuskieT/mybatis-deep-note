package org.chris.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatis.entity.StudentSelfCard;


@Mapper
public interface StudentSelfcardDao {
    StudentSelfCard findStudentSelfcardByStudentId(Integer studentId);
}