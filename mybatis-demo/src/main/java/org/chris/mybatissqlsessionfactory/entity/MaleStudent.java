package org.chris.mybatissqlsessionfactory.entity;

import lombok.Data;

import java.util.List;
/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 所有男生健康信息
 */
@Data
public class MaleStudent extends Student {
    private List<StudentHealthMale> studentHealthMaleList = null;
}
