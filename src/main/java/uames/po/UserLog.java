package uames.po;

/**
 * 用户日志
 * type 类型：1 登录日志; 2 修改登录密码; 3 安全退出
 */
public class UserLog extends Base  {

    private Long user_id;
    private Integer type;
    private String content;
    public Long getUser_id() {
        return user_id;
    }
    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    
    /**
     * 
CREATE TABLE `rebates` (
`id` bigint(20) NOT NULL AUTO_INCREMENT,
`user_id` bigint(20) DEFAULT null ,
`type` int(11) DEFAULT 0,
`content` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
     */
}
