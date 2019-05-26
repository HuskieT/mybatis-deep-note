package org.chris.mybatissqlsessionfactory.config;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.chris.mybatissqlsessionfactory.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Reader;

/**
 * @Author renlf
 * @Date 2018-08-23 14:02
 * @Description 从XML中构建SqlSessionFactory
 **/
public class FirstKindConfig {
    private static  final Logger log = LoggerFactory.getLogger(FirstKindConfig.class);

    public static  SqlSession getSession()throws Exception{
        //配置文件的名称
        String resource = "configuration.xml";
        //通过Mybatis包中的Resources对象很轻松的获取到配置文件
        Reader reader = Resources.getResourceAsReader(resource);
        //通过SqlSessionFactoryBuilder创建
        SqlSessionFactory  sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        //获得session实例
        SqlSession sqlSession = sessionFactory.openSession();
        return sqlSession;
    }

    public static void main(String[] args)throws Exception {
        //配置文件的名称
        String resource = "configuration.xml";
        //通过Mybatis包中的Resources对象很轻松的获取到配置文件
        Reader reader = Resources.getResourceAsReader(resource);
        //通过SqlSessionFactoryBuilder创建
        SqlSessionFactory  sessionFactory = new SqlSessionFactoryBuilder().build(reader);
        //获得session实例
        SqlSession sqlSession = sessionFactory.openSession();

        User user = new User();
        user.setCnName("puder");
        user.setPassword("123456");
        sqlSession.insert("insert1",user);
        sqlSession.commit();
        sqlSession.close();
        log.error("a",sessionFactory);
    }
}
