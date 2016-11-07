package uames.process;

import java.util.ArrayList;
import java.util.List;

import uames.po.Article;
import uames.po.ArticleCat;
import uames.service.impl.ArticleCatImpl;
import uames.service.impl.ArticleImpl;
import uames.util.UamesUtil;
import uames.vo.ArticleVo;

public class ArticlePrc {
	/**
	 * 文章列表
	 * 
	 * @param type
	 * @param count (读取数量)
	 * @return
	 */
	public List<ArticleVo> getArtList(String type, Integer count) {
		List<ArticleVo> result = new ArrayList<ArticleVo>();
		try {
			List<Article> vos = new ArrayList<Article>();

			ArticleCat po = new ArticleCatImpl().getOne(" cat_name = \"" + type + "\"");
			if (po != null && po.getId() != null && po.getId() > 0) {
				Long catid = po.getId();
				vos = new ArticleImpl().queryBySql(" cat_id= " + catid,0, count);
				if (vos != null)
					result = ArticleVo.createList(vos);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
