package controller;

import java.util.Date;

import uames.po.Article;
import uames.service.impl.ArticleImpl;
import uames.util.PageUtil;

public class UserController extends BaseController {
	public UserController() {
        super();
        viewPath = "/WEB-INF/view/user/";
    }

	public void index(){
		if(this.isLog()){
			ArticleImpl impl = new ArticleImpl();
			Integer page = getParaToInt("page");
			Integer psize = 8;
			PageUtil<Article> plist = impl.getPgList(null, null, page!=null&&page>0?page:1, psize, "order by sort asc, add_time desc");
			
			setAttr("list", plist.getList());
			setAttr("count", plist.getCount());
			
			setAttr("page", plist.getPage());
			setAttr("psize", psize);
			setAttr("pcount", plist.getPagecount());
			
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
			Long id = getParaToLong("id");
			if(id!=null && id>0){
				ArticleImpl impl = new ArticleImpl();
				Article d = impl.getArticleById(id);
				setAttr("vo", d);
			}
			renderJsp("addArticle.jsp");
		}else{
			redirect("/login");
		}
	}
	
	public void submitArtical(){
		if(this.isLog()){
			Article a = new Article();
			a.setTitle(getPara("title"));
			a.setContent(getPara("content"));
			a.setDesc(getPara("desc"));
			a.setCat_id(getParaToLong("catId"));
			a.setThumb(getPara("thumb"));
			a.setAuthor("giggling");
			a.setAdd_time((new Date().getTime()/1000));
			Long id = getParaToLong("id");
			if(id!=null && id>0){
				a.setId(id);
			}
			ArticleImpl impl = new ArticleImpl();
			Long b = impl.saveOrUpdate(a);
			
			if(b!=null && b>0 || id>0){
				getJsonResult().setStatus(1);
				getJsonResult().setMsg("保存成功");
			}else{
				getJsonResult().setStatus(0);
				getJsonResult().setMsg("保存失败");
			}
		}else{
			getJsonResult().setStatus(0);
			getJsonResult().setMsg("请先登陆");
		}
		renderJson(getJsonResult());
	}
	public void delArticle(){
		if(this.isLog()){
			Long id = getParaToLong("id");
			if(id!=null && id>0){
				ArticleImpl impl = new ArticleImpl();
				impl.deleteById(id);
				getJsonResult().setStatus(1);
				getJsonResult().setMsg("删除成功");
			}
		}else{
			getJsonResult().setStatus(0);
			getJsonResult().setMsg("请先登陆");
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
