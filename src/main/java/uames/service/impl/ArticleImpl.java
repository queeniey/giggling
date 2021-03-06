package uames.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import uames.po.Article;
import uames.service.IArticle;
import uames.util.PageUtil;
import uames.util.SetValueFromRecord;

public class ArticleImpl  extends BaseImpl<Article> implements IArticle {
    public ArticleImpl() {
        tableName = "article";
    }
    public ArticleImpl(String tablename) {
        tableName = tablename;
    }
    @Override
    public Article createPo() {
        return new Article();
    }
    
    public boolean addArticle(String title, String content, Long cat_id, String desc, String thumb, String author){
    	Record record = new Record();
		record.set("title", title);
    	record.set("content", content);
    	record.set("cat_id", cat_id);
    	record.set("desc", desc);
    	record.set("thumb", thumb);
    	record.set("author", author);
    	
    	record.set("add_time", (int)(new Date().getTime()/1000));
    	
    	
    	boolean b = Db.save(this.tableName, record);
    	return b;
    }
    
	@Override
	public Article getArticleById(Long id) {
		String sql ="select a.* from article a where a.id=" + id;
        Record record = Db.findFirst(sql);
        Article data = new Article();

        SetValueFromRecord.copyProtis(data, record);
        return data;		
	}
	
	public Article getArticMinsort(Long catid){
		String sql ="select a.id from article a where a.cat_id = " +catid +" ORDER BY sort DESC limit 1" ;
        Record record = Db.findFirst(sql);
        Article data = new Article();

        SetValueFromRecord.copyProtis(data, record);
        return data;
	}
	/**
	 * 文章列表
	 * @param where
	 * @return
	 */
    public List<Article> queryBySql(String where,Integer pNu, Integer count) {
    	
    	return this.getPgList(where, null, pNu, count).getList();

       
    }   
    
    public PageUtil<Article> getPgList(String where, String columns, Integer pNu,
            Integer pSize, String orderby) {
        try {
            total = count(where);
            if (pSize != null) {
                this.pSize = pSize;
            }
            pCount = Integer.valueOf(String.valueOf(total / this.pSize
                    + (total % this.pSize > 0 ? 1 : 0)));
            this.pNu = pNu == null ? 1 : (pCount < pNu ? pCount : pNu);
            page = new PageUtil<Article>();
            page.setList(queryBySql(where, columns, orderby, (this.pNu - 1) * pSize,
                    pSize));
            page.setCount(total);
            page.setPagecount(pCount);
            page.setPage(pNu);
            page.setStatus(1);
        } catch (Exception e) {
            e.printStackTrace();
            page.setStatus(0);
        }

        return page;
    }

    public PageUtil<Article> getList(Map<String, String> t_where, String columns, Integer pNu, Integer pSize) {
        try{
            String where ="";
            String _where = "";
            StringBuilder s_where = new StringBuilder();
            StringBuilder _s_where = new StringBuilder();
            Integer i=0;
            for (Map.Entry<String, String> entry : t_where.entrySet()) {
                if(i>0){
                    s_where.append(" AND ");
                    _s_where.append(" AND ");
                }
                if(entry.getValue()!=null){
                    s_where.append(" " + entry.getKey() + entry.getValue());
                    _s_where.append(" " + entry.getKey() + entry.getValue());
                    i++;
                }
            }
            if(s_where.length()<1){
                where  = null;
                _where= null;
            }else{
                where = s_where.toString();
                _where= _s_where.toString();
            }

            total = count(where);
            if (pSize != null) {
                this.pSize = pSize;
            }
            pCount = Integer.valueOf(String.valueOf(total / this.pSize + (total % this.pSize > 0 ? 1 : 0)));
            this.pNu = pNu == null ? 1 : (pCount < pNu ? pCount : pNu);
            page = new PageUtil<Article>();
            if(_where==null || _where.equals("")){
                _where = " status>0 ";
            }else{
                _where = _where + " and status>0 ";
            }
            if(this.pNu>0)
                page.setList(queryBySql(_where, columns," order by add_time desc ", (this.pNu - 1) * pSize, pSize));
            else
                page.setList(queryBySql(_where, columns," order by add_time desc ", 0, pSize));
            page.setCount(total);
            page.setPagecount(pCount);
            page.setPage(this.pNu);
            page.setStatus(1);
        }catch(Exception e){
            e.printStackTrace();
            page.setStatus(0);
        }

        return page;
    }
}
