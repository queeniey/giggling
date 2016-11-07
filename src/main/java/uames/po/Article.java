package uames.po;

public class Article extends Base {
	private String title;
	private String content;
	private String desc;
	private String thumb;
	private Long cat_id;
	private String style;
	private String keywords;
	private String url;
	private String author;
	private String source;
	private String source_url;
	private String tags;
	private Long views;
	private Long day_views;
	private Long week_views;
	private Long month_views;

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getCat_id() {
		return cat_id;
	}

	public void setCat_id(Long cat_id) {
		this.cat_id = cat_id;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }


	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSource_url() {
		return source_url;
	}

	public void setSource_url(String source_url) {
		this.source_url = source_url;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public Long getViews() {
		return views;
	}

	public void setViews(Long views) {
		this.views = views;
	}

	public Long getDay_views() {
		return day_views;
	}

	public void setDay_views(Long day_views) {
		this.day_views = day_views;
	}

	public Long getWeek_views() {
		return week_views;
	}

	public void setWeek_views(Long week_views) {
		this.week_views = week_views;
	}

	public Long getMonth_views() {
		return month_views;
	}

	public void setMonth_views(Long month_views) {
		this.month_views = month_views;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

    
}
