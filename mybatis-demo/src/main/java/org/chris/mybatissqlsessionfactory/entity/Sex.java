package org.chris.mybatissqlsessionfactory.entity;

/**
 * @Auther: chris
 * @Date: 2019/4/13 15:11
 * @Description: 性别枚举类
 */
public enum  Sex {
    /**
     *男
     */
    MALE(1,"男"),
    /**
     *女
     */
    FEMALE(2,"女");
    private int id;
    private String name;

    Sex(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static Sex getSex(int id){
        if (1==id){
            return MALE;
        }else  if(2==id){
            return FEMALE;
        }
        return null;
    }
}
