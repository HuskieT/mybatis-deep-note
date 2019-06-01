package org.chris.mybatis.config;

/**
 * @Author renlf
 * @Date 2018-08-23 14:51
 * @Description
 **/
public class ThreeKindConfig {

    public static void main(String[] args) {
        //在spring的配置文件applicationContext.xml中配置
        /*
        * <bean id="sessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        * <property name="dataSource" ref="dataSource" />
        * <property name="configLocation" value="classpath*:conf/configuration.xml" /></bean>
        *
        * */
        //如果使用则直接注入，获取SqlSessionFactory实例即可。
    }
}
