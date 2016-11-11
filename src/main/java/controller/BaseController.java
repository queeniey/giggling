package controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.log.Logger;

import uames.po.Article;
import uames.service.impl.ArticleImpl;
import uames.util.Browse;
import uames.util.Toolkit;
import uames.util.UamesUtil;
import uames.vo.ArticleVo;
import uames.vo.WebResult;

public class BaseController extends Controller {
    
    @SuppressWarnings("unused")
    private static Logger log = Logger.getLogger(BaseController.class);
	protected Toolkit tk;
	protected String viewPath = "";
	private WebResult jsonResult;
	public Integer pageSize;
	public Long userId;
	
	public BaseController() {
		super();
	    tk = new Toolkit(this);
		pageSize = 16;
	}
	public WebResult getJsonResult () {
	    if (jsonResult == null) {
	        jsonResult = new WebResult();
	    }
	    return jsonResult;
	}
	
	/**
	 * 手机web可以访问的页面
	 * @param f 要访问的页面的jsp文件路径
	 * @return
	 */
	private boolean getPhoneJsp(String f){
	    return !(UamesUtil.getUri(getRequest()).contains("/m/")) && !f.contains("/m/");
	}
	protected boolean isLog(){
		Browse b = tk.getBrowse();
		if(b.getUserID() > 0){
			this.userId = b.getUserID();
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public void renderJsp(String f) {
		setAttr("blog",DefaultConfig.getPropery("blog"));
		setAttr("basePath", DefaultConfig.getPropery("basePath"));
	    setAttr("tk", tk);
	    super.renderJsp(viewPath + f);
	}
}
