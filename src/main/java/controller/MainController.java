package controller;

import java.util.List;

import uames.po.Article;
import uames.po.User;
import uames.service.impl.ArticleImpl;
import uames.service.impl.UserImpl;
import uames.util.Browse;
import uames.util.PageUtil;

public class MainController extends BaseController {
	public MainController() {
        super();
        viewPath = "/WEB-INF/view/main/";
    }
	/**
	 * 文章列表（分页）
	 */
	public void index() {
		ArticleImpl i = new ArticleImpl();
		Integer pNu = getParaToInt("page");
		if("".equals(pNu)){
			pNu = 1;
		}
		List<Article> page = i.queryBySql(null, pNu, 8);
		setAttr("list", page);	
	    renderJsp("index.jsp");
	}
	/**
	 * 文章详情
	 */
	public void detail() {
		ArticleImpl i = new ArticleImpl();
		Article a = new Article();
		Long id = getParaToLong("id");
		if(id == null || "".equals(id)){
			redirect("index");
		}else{
			a = i.getArticleById(id);
			setAttr("vo", a);
		    renderJsp("detail.jsp");
		}	
	}
	
	/**
	 * 登录页面
	 */
	public void login() {
		if(this.isLog()){ // 已经登陆，跳转至用户首页
			redirect("/user/index");
		}else{
			renderJsp("login.jsp");
		}
	}
	public void login_two() {
		renderJsp("login_two.jsp");
	}
	/**
	 * 登陆提交
	 */
	public void loginsubmit(){
		String pwd = getPara("pwd");
		String ac = getPara("account");
		
		UserImpl impl = new UserImpl();
		User user = impl.getByAccount(ac);
		if(user.getPassword().equals(pwd)){
			Browse b = tk.getBrowse();
			b.setUserID(user.getId());
			tk.saveBrowse();
			
			getJsonResult().setStatus(1);
			getJsonResult().setMsg("登陆成功");
		}else{
			getJsonResult().setStatus(0);
			getJsonResult().setMsg("账号或密码错误");
		}
		renderJson(getJsonResult());
	}
	
	public void show() {
	    renderJsp("show.jsp");
	}
	
}
