package uames.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import com.jfinal.core.Controller;

import net.sf.json.JSONObject;
import uames.po.User;
import uames.service.IUser;
import uames.service.impl.UserImpl;
import uames.vo.UserVo;

public class Toolkit {
    private Controller ctrl;
    private Browse browse;
    private UserVo user;
    private String cookiesId = "giggling";

    public Toolkit(Controller ctrl) {
        this.ctrl = ctrl;
    }

    public String getSslHost() {
        return ctrl.getRequest().getHeader("X-ssl") != null ? ("https://" + ctrl.getRequest().getServerName()) : "";
    }
    public String getUnSslHost() {
        return ctrl.getRequest().getHeader("X-ssl") != null ? ("http://" + ctrl.getRequest().getServerName()) +"/" : "";
    }
    public String getUnSslHost2() {
        return "http://" + ctrl.getRequest().getServerName() +"/";
    }
    
    /**
     * 设置COOKIE <param name="cookieKey">COOKIE名称</param> <param
     * name="cookieValue">COOKIE值</param>
     */
    public void setCookie(String cookieKey, String cookieValue, String path) {
        Cookie cookie = new Cookie(cookieKey, cookieValue);
        cookie.setPath(path == null ? "/" : path);
        ctrl.getResponse().addCookie(cookie);
    }

    /**
     * 设置COOKIE <param name="cookieKey">COOKIE名称</param>
     */
    public String getCookie(String cookieKey) {
        Cookie[] cookies = ctrl.getRequest().getCookies();
        String str = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookieKey.equals(cookie.getName())) {
                    str = cookie.getValue();
                    break;
                }
            }
        }
        return str;
    }

    public String makeBrowseId() {
        Long time = new Date().getTime();
        String str = UamesUtil.getRandStr();
        return ParseMD5.parseStrToMd5L32(str+time.toString());
    }
    
    public Browse getBrowse() {
        if (browse == null) {
            String str = getCookie(cookiesId);
            if (str.isEmpty()) {
                 setBrowse(UamesUtil.getGlobalID());
            } else {
                browse = (Browse) JSONObject.toBean(JSONObject.fromObject(JedisUtil.get(str)), Browse.class);
                if (browse == null) {
                    setBrowse(str);
                }
            }
        }
        return browse;
    }
    
    private void setBrowse(String key) {
        browse = new Browse();
        browse.setId(key);
        saveBrowse();
        setCookie(cookiesId, String.valueOf(browse.getId()), null);
    }
    private void setBrowse(String key,String ip) {
        browse = new Browse();
        browse.setId(key);
        saveBrowse(ip);
    }
    
    public void saveBrowse() {
        JedisUtil.put(String.valueOf(browse.getId()), UamesUtil.getJSONStringFromObject(getBrowse()));
    }
    public Browse getBrowse(String ip) {
        if (browse == null) {
            String str = ip;
            if (str.isEmpty()) {
                 setBrowse(UamesUtil.getGlobalID());
            } else {
                browse = (Browse) JSONObject.toBean(JSONObject.fromObject(JedisUtil.get(str)), Browse.class);
                if (browse == null) {
                    setBrowse(str,ip);
                }
            }
        }
        return browse;
    }
    public void saveBrowse(String ip) {
        setCookie(cookiesId, String.valueOf(browse.getId()), null);
        JedisUtil.put(ip, UamesUtil.getJSONStringFromObject(getBrowse()));
    }

    /**
     * 注销登录
     */
    public void logout(User u) {
        getBrowse().setUserID(-1);
        saveBrowse();
    }
    
    public String getAccoutn(){
    	return getUser().getPo().getAccount();
    }
    
    public boolean getIsLogin() {
        return getBrowse().getUserID() > 0;
    }
    
    public void setIconCode(String code) {
        getBrowse().setIconCode(code);
        getBrowse().setIconCodeLife(new Date());
        saveBrowse();
    }
    

    public String getIconCode() {
        return new Date().getTime() < getBrowse().getIconCodeLife().getTime() + 10 * 60 * 1000 ? getBrowse().getIconCode() : "";
    }
    
    public String getWebRoot() {
        return ctrl.getSession().getServletContext().getRealPath("/");
    }

    public UserVo getUser() {
        if (!UamesUtil.IsNullOrWhiteSpace(getBrowse().getId()) && user == null) {
            IUser userSvc = new UserImpl();
            user = new UserVo(userSvc.getOne(getBrowse().getUserID()));
        }
        return user;
    }
    
    /**
     * 时间转换
     * @param date
     * @param format
     * @return
     */
    public String getSimpleDateFormat(Long date,String format){
    	SimpleDateFormat sdate = new SimpleDateFormat();
    	if(format.toLowerCase()=="yyyy-MM-dd")
    		sdate=new SimpleDateFormat("yyyy-MM-dd");
    	else if(format.toLowerCase()=="yyyy-MM-dd HH:mm:ss")
    		sdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	else
    		sdate=new SimpleDateFormat("");
    	return sdate.format(date);
    }    
    
    public void setUser(UserVo u) {
        
    }

	
    /**
     * 上午1、中午2、下午3、晚上4
     */
    public String getNowTime(){
        String t="0";
        SimpleDateFormat sdate = new SimpleDateFormat("HH");
        int hour = Integer.parseInt(sdate.format(new Date()));
        if(hour>=0 && hour<=6 || hour<=24 && hour>=18){
            t="晚上";
        }else if(hour<=18 && hour>=14){
            t="下午";
        }else if(hour<=14 && hour>=12){
            t="中午";
        }else{
            t="上午";
        }
        return t;
    }

}
