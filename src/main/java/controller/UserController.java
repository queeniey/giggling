package controller;

import javax.servlet.http.HttpServletRequest;

import uames.service.impl.ArticleImpl;

public class UserController extends BaseController {
	public UserController() {
        super();
        viewPath = "/WEB-INF/view/user/";
    }

	public void index(){
		if(this.isLog()){
			renderJsp("index.jsp");
		}else{
			redirect("/login");
		}
	}
	/**
	 * 添加文章
	 * @throws Exception
	 */
	public void addArticle() throws Exception {
		if(this.isLog()){
			renderJsp("addArticle.jsp");
		}else{
			redirect("/login");
		}
	}
	
	public void submitArtical(){
		String title = getPara("title");
		String content = getPara("content");
		String desc = getPara("desc");
		Long cat_id = getParaToLong("catId");
		String thumb = getPara("thumb");
		String author = getPara("author");
		ArticleImpl impl = new ArticleImpl();
		boolean b = impl.addArticle(title, content, cat_id, desc, thumb, author);
		
		if(b){
			getJsonResult().setStatus(1);
			getJsonResult().setMsg("保存成功");
		}else{
			getJsonResult().setStatus(0);
			getJsonResult().setMsg("保存失败");
		}
		renderJson(getJsonResult());
	}

	/**
	 * 检查图片验证码是否正确
	 */
	public void checkcode() {
	    int status = 0;
	    if(tk.getIconCode().equals(getPara("code"))){
	        status = 1;
	    }
		getJsonResult().setStatus(status);
		renderJson(getJsonResult());
	}
	
	

    
	/**
	 * 设置密码
	 * @throws Exception 
	 */
	public void setpwd() throws Exception {
		renderJsp("setpwd.jsp");
	}
}
