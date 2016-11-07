package uames.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import uames.po.User;
import uames.service.IUser;
import uames.util.SetValueFromRecord;

public class UserImpl extends BaseImpl<User> implements IUser {

    public UserImpl() {
        this.tableName = "admin"; // 需要操作的数据库表
    }

    @Override
    public User createPo() {
        return new User();
    }
    
    public User getByAccount(String ac) {
        User user = new User();
        try {
            String sql = "select *from " + tableName +" where  account = '" + ac +"'"; 
            Record record = Db.findFirst(sql);
            if(record!=null)
                SetValueFromRecord.copyProtis(user, record);
            else
                user = null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    
    @Override
    public List<User> queryBySql(String where, String columns,String orderby, Integer start, Integer count) {
        try {
            StringBuffer buffer = new StringBuffer();
            if (columns == null) {
                buffer.append("select * from " + this.tableName);
            } else {
                buffer.append("select " + columns);
            }
            if (where != null) {
                buffer.append(" where " + where);
            }
            if(orderby!=null)
                buffer.append(orderby);
            
            if (count != null) {
                if (start != null) {
                    buffer.append(" limit " + start + ", " + count);
                } else {
                    buffer.append(" limit " + count);
                }
            }
            List<Record> list = Db.find(buffer.toString());
            List<User> vos = new ArrayList<User>();
            for (Record record : list) {
                User obj = createPo();
                SetValueFromRecord.copyProtis(obj, record);
                vos.add(obj);
            }
            return vos;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
