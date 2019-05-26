package org.chris.mybatissqlsessionfactory.mapper;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Auther: chris
 * @Date: 2019/4/14 08:36
 * @Description:  resultMap  Association 一对一测试
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class AssociationTest {

    @Autowired
    private  StudentDao studentDao;


    @Test
    @Transactional
    public  void associationTs() {
        SqlSession sqlSession = null;
        try {
            System.out.println(studentDao.getStudent(1));
            System.out.println(studentDao.getStudent(2));
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        log.info("执行成功!");
    }
}
