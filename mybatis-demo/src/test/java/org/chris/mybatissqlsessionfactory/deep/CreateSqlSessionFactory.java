package org.chris.mybatissqlsessionfactory.deep;

import org.apache.ibatis.datasource.pooled.PooledDataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.chris.mybatis.entity.Role;
import org.chris.mybatis.mapper.RoleMapper;


/**
 * @Auther: chris
 * @Date: 2019/4/13 12:07
 * @Description: 代码方式创建sqlSessionFactory
 */
public class CreateSqlSessionFactory {


    public   SqlSessionFactory  createSqlSessionFactory(){
        //driver ulr username password
        //构建数据库连接池
        PooledDataSource pooledDataSource = new PooledDataSource("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&useSSL=false","root","123456");
        //构建数据库事务
        TransactionFactory factory = new JdbcTransactionFactory();
        //创建数据库环境1
        Environment environment = new Environment( "development",factory,pooledDataSource );
        //构建Configuration
        Configuration configuration1 = new Configuration(environment);
        //注册一个MyBatis上下文别名
        configuration1.getTypeAliasRegistry().registerAlias("role",Role.class);
        //加入一个映射器
        configuration1.addMapper(RoleMapper.class);
        //使用SqlSessionFactoryBuilder构建 SqlSessionFactory
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration1);

        return sqlSessionFactory;
    }



}
