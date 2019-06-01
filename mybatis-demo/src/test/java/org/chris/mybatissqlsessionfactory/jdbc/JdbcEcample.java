package org.chris.mybatissqlsessionfactory.jdbc;

import org.chris.mybatis.entity.Role;

import java.sql.*;
import java.util.Date;

/**
 * @Auther: chris
 * @Date: 2019/4/11 22:00
 * @Description:  jdbc连接数据库
 */
public class JdbcEcample {

    //注册驱动获取Connection
    private Connection getConection(){
        Connection connection = null;
        try {
            /**
             * 加载cmo.mysql.jdbc.Drive类 将Drive类注册进DriverManager中
             * cmo.mysql.jdbc.Drive类 有如下静态块
             *  static {
             *         try {
             *             DriverManager.registerDriver(new Driver());
             *         } catch (SQLException var1) {
             *             throw new RuntimeException("Can't register driver!");
             *         }
             *     }
             * */

//            Class<Driver>  driver = (Class<Driver>) Class.forName( "com.mysql.jdbc.Driver" );
            Class.forName( "com.mysql.cj.jdbc.Driver" );
            String url = "jdbc:mysql://localhost:3306/mybatis-deep-learning-db?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&serverTimezone=Asia/Shanghai&useSSL=false";
            String user = "root";
            String pass = "123456";
            connection = DriverManager.getConnection(url,user,pass  );
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return  connection;
    }
    public Role getRole (Integer id){
        Connection connection = getConection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement =  connection.prepareStatement( "select * from t_role where  id = ?" );
            preparedStatement.setInt( 1,id );
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Integer roleId = resultSet.getInt( "id" );
                String roleName = resultSet.getString( "role_name" );
                String desc = resultSet.getString( "note" );
                Date date = resultSet.getDate( "create_time" );
                Role role = new Role();
                role.setId( roleId );
                role.setRoleName( roleName );
                role.setNote(desc);
                role.setCreateDate( date );
                return role;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            this.close(resultSet,preparedStatement,connection);
        }
        return  null;

    }

    private void  close(ResultSet resultSet, Statement statement ,Connection connection){
        try {
            if(resultSet!=null && !resultSet.isClosed()){
                    resultSet.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (statement!=null && !statement.isClosed()){
                statement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (connection!=null && !connection.isClosed()){
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        JdbcEcample example = new JdbcEcample();
        Role role = example.getRole( 2);
        System.out.println(role.getRoleName());
    }
}
