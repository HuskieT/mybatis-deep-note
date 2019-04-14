package org.chris.mybatissqlsessionfactory.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.chris.mybatissqlsessionfactory.entity.StudentSelfCard;


@Mapper
public interface StudentSelfcardDao {
    StudentSelfCard findStudentSelfcardByStudentId(Integer studentId);
}