package uames.vo;

import uames.po.User;

public class UserVo extends BaseVo<User> {

    
    public UserVo(User t) {
        super(t);
    }

    public UserVo() {
        super();
        setPo(new User());
    }
}
