package org.chris.mybatissqlsessionfactory.config;

import org.apache.ibatis.datasource.pooled.PooledDataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.chris.mybatissqlsessionfactory.entity.User;
import org.chris.mybatissqlsessionfactory.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;

/**
 * @Author renlf
 * @Date 2018-08-23 14:18
 * @Description
 **/
public class SecondKindConfig {
    private static  final Logger log = LoggerFactory.getLogger(SecondKindConfig.class);


    public static void main(String[] args) {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&useSSL=false";
        String username="root";
        String password="123456";

        /*
         * <dataSource type="POOLED">
                <property name="driver" value="${jdbc.driverClassName}"/>
                <property name="url" value="${jdbc.url}"/>
                <property name="username" value="${jdbc.username}"/>
                <property name="password" value="${jdbc.password}"/>
            </dataSource>
         */
        //创建使用缓存池的数据源
        DataSource dataSource =new PooledDataSource(driver,url,username,password);


        /*
         * <transactionManager type="JDBC" />
         */
        //创建事务
        TransactionFactory transactionFactory =  new JdbcTransactionFactory();
        Environment environment = new Environment("development", transactionFactory, dataSource);
        Configuration configuration = new Configuration(environment);

        /*
         * <mapper resource="ssm/BlogMapper.xml"/>
         */
        //加入资源
        configuration.addMapper(UserMapper.class);
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(configuration);
        SqlSession sqlSession = sessionFactory.openSession();

        User user = new User();
        user.setUserName("longxia");
        user.setPassword("123456");
        sqlSession.insert("insert",user);
        sqlSession.commit();
        sqlSession.close();







    }
}
