package org.chris.mybatis.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @Auther: chris
 * @Date: 2019/4/13 14:28
 * @Description:  自定义TypeHandler（类型处理器）
 */
@MappedJdbcTypes( JdbcType.VARCHAR )
@MappedTypes( {String.class} )
@Slf4j
public class MyTypeHandler implements TypeHandler<String> {


    @Override
    public void setParameter(PreparedStatement preparedStatement, int i, String value, JdbcType jdbcType) throws SQLException {
            log.info( "使用我的TypeHandler" );
        preparedStatement.setString( i,value);
    }

    @Override
    public String getResult(ResultSet resultSet, String s) throws SQLException {
        log.info( "使用我的TypeHandler ，ResultSet 列名获取字符串" );
        return resultSet.getString( s );
    }

    @Override
    public String getResult(ResultSet resultSet, int i) throws SQLException {
        log.info( "使用我的TypeHandler ，ResultSet 下标获取字符串" );
        return resultSet.getString( i );
    }

    @Override
    public String getResult(CallableStatement callableStatement, int i) throws SQLException {
        log.info( "使用我的TypeHandler ，CallableStatement 下标获取字符串" );
        return callableStatement.getString( i );
    }
}
