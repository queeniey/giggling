/**
 * MADE BY JIM
 * 2016-04-19
 * 依赖jquery.js, layer.js
 *
 * 在其它项目使用需正确设置“资源路径”respath和“资源路径到public父文件夹的路径”pubpath
 * 资源路径"respath"：到js/css/images的父级文件夹
 * 资源路径到public父文件夹的路径"pubpath"：若本组件放在js/lib下，则pubpath="/js/lib";
 *
 */
var Pub = {
	f:{},//function
	p:{},//param
	DEBUG: true,
	curScript: document.currentScript,
	//初始化参数值
	initParas : function(){
		//定义参数空间  已在comm.js定义
		$.paras?"":$.extend({paras:{}});

		//定义资源路径  已在comm.js定义
		$.paras.mobileHost = $("#mobile_host").val();
		//$.paras.mobileHost?"":$.paras.mobileHost = "http://192.168.1.32:83/";
		$.paras.mobileHost?"":$.paras.mobileHost = "http://m.taozhenwang.com/";
		// $.paras.mobileHost?"":$.paras.mobileHost = "http://m.tzb.com/";
		$.paras.respath?"":$.paras.respath = $.paras.mobileHost + "/Public/201504";
	},
	Defaults: {
		loadCss: function(){}, //异步加载CSS文件   Pub.Defaults.loadCSS('/js/layer/skin/layer.css');
		loadJs: function(){}, //异步加载JS文件
		/**需要CSS的begin*/
		loading: function(){}, //请求中效果,加载遮罩层
		removeLoading: function(){}, //隐藏请求效果,去除遮罩层

		bottomLoading: function(){}, //底部异步请求中效果
		removeBottomLoading: function(){}, //隐藏底部异步请求中效果

		getBase64Image: function(){},
		/**需要CSS的end*/

		/**工具方法begin*/

		/**工具方法end*/
	},

	createNew: function(){
		// if(Pub.f.selfReload(Pub.curScript,19)){
		// 	return;
		// }
		Pub.f.loadCss('/js/lib/public/public.css');
	},

	init: function(){
		var respath = $.paras.respath;//资源路径，到js/css/images的父级文件夹
		var pubpath = '/js/lib';//资源路径到public "父"文件夹的路径

		Pub.f.loadCss = function(url){
			var c = document.createElement("link");
            c.rel = "stylesheet";
            c.rev = "stylesheet";
            c.type = "text/css";
            c.media = "screen";
            c.href = respath+url;
            $("head").append(c);
		};
		Pub.f.loadJs = function(url){
			 var s = document.createElement('script');
		     s.type = 'text/javascript';
		     s.async = true;
		     if(url.indexOf("http://")<0){
					 s.src = respath+url;
				 }else{
					 s.src = url;
				 }
		     $("head").append(s);
		     //document.getElementsByTagName("body")[0].appendChild(s);
		};
		Pub.f.getScript = function(url,endFun){
	     if(url.indexOf("http://")<0){
				 url = respath+url;
			 }
	     $.getScript(url,endFun);
		};

		//默认加载layer，并封装 $.alert();
		if(Pub.curScript.src.indexOf('nolayer=1')==-1){
			Pub.f.loadCss('/js/lib/layer/need/layer.css');
			Pub.f.loadCss('/js/lib/layer/skin/layer.css');
			if(typeof layer!="object"){
				Pub.f.loadJs('/js/lib/layer/layer.js');
			}
		}

		$.extend({
			alert:function(msg){
				if(typeof layer=="object"){
					try{layer.msg(msg);}
					catch(e){console.log(e);Pub.f.alert(msg);}
				}else{
					console.log("layer.js没有成功加载");
					Pub.f.alert(msg);
				}
			},
			loading:function(type,param){
				if(typeof layer=="object"){
					try{layer.load(type,param);}
					catch(e){console.log(e);Pub.f.loading();}
				}else{
					console.log("layer.js没有成功加载");
					Pub.f.loading();
				}
			},
			rmLoading:function(){
				if(typeof layer=="object"){
					try{layer.closeAll();}
					catch(e){Pub.f.removeLoading();}
				}else{
					Pub.f.removeLoading();
				}
			}
		});
		Pub.f.alert = function(msg){
			clearTimeout(Pub.p.alertTimeoutId);
			$("#layerPub").hide();
			if(!$("#layerPub").length){
				$("body").append([
					'<div id="layerPub" class="layui-layer layui-anim layui-layer-border layui-layer-msg layui-layer-hui" style="display:none;z-index: 19891016;top:45%;">',
					'	<div id="layerPubMsg" class="layui-layer-content"></div>',
					'</div>'
				].join(""));
			}
			$("#layerPubMsg").html(msg);
			var left = (window.screen.width-$("#layerPub").width())/2;
			$("#layerPub").css("left",left).show();

			Pub.p.alertTimeoutId = setTimeout(function () {
				$("#layerPub").hide();
			}, 3000);
		}
		Pub.f.showCatchErr = function(e,curScript){
			console.log(e);//输出到console
			if(Pub.DEBUG){
				if(!curScript)curScript="null curScript";
				var msg = curScript.src;
				if(!msg){msg = curScript;}
				$("body").append('<div style="margin-bottom:100px;">'+e+'<br/>[JSDEBUG]'+msg+'</div>');
			}
		};
		Pub.f.jsLog = function(msg){
			$.ajax({
				url: '/main/index/jsLog',
				cache: false,
				type: 'post',
				dataType: 'json',
				data: {
					log: msg,
				}
			});
		};
		//请求中效果,加载遮罩层  这里待整合，去掉~改用 var index = layer.load(2);
		//var index = layer.load(2); 发现某些地方（如导入商品页面）不能使用 layer，原因未知，故先保留此处
		Pub.f.loading = function(){
			var $loading = $('#loading'),
					loadW = $(window).width(),
					loadH = $(window).height();
			if(! $loading.length){
				$('body').append('<div id="loading"><span class="load-img"></span></div>');
				loadImg = $('.load-img').eq(0);
				loadImg.css({'margin': (loadH - loadImg.height())/2 + 'px' + ' 0 0 ' + (loadW-loadImg.width())/2 + 'px'});
			}

			$('#loading').height(loadH).show();
			$(document).on({
				touchstart: function(ev){
					ev.preventDefault();
					ev.stopPropagation();
				}
			});
			return true;
		};
		//移除请求效果,去除遮罩层 这里待整合，去掉~改用 layer.close(index);
		Pub.f.removeLoading = function(){
			$('#loading').hide();
			$(document).unbind('touchstart');
			return true;
		};
		//重新加载该js，慎用~ TODO ： 需要一个外部值来提供判断！ 引入cookie
		Pub.f.selfReload = function(s,n){
			Pub.cookies();
			if(s.src.indexOf('bust='+n)<0){
				if(s.src.indexOf('?')<0){
					Pub.f.loadJs(s.src+'?bust='+n);
				}else{
					if(s.src.indexOf('bust=')<0){
						Pub.f.loadJs(s.src+'&bust='+n);
					}else{
						alert();
					}
				}
				return true;
			}else{
				return false;
			}
		}
		//获取浏览器类型及版本，返回字符串。
		Pub.f.browserInfo = function(){
			var browser='', ua = navigator.userAgent.toLowerCase(), s;
			(s = ua.match(/micromessenger\/([\d.]+)/)) ? browser = 'micromessenger' :
			(s = ua.match(/applewebkit.([\d.]+)/)) ? browser='appleAPP' :
		    (s = ua.match(/edge\/([\d.]+)/)) ? browser = 'edge' :
		    (s = ua.match(/chrome\/([\d.]+)/)) ? browser = 'chrome' :
			(s = ua.match(/version\/([\d.]+).*safari/)) ? browser='safari' :
		    (s = ua.match(/firefox\/([\d.]+)/)) ? browser='firefox' :
		    (s = ua.match(/opera.([\d.]+)/)) ? browser='opera' :
		    (s = ua.match(/msie ([\d.]+)/)) ? browser='ie' :0;
		    if(s!=null)
		    	return browser + '/' + s[1];
		    else
		    	return "unknowBrowser";
		}
		/**
		 * 页面更改数据后需要用history.back()返回，但又需要刷新数据时，
		 * 调用此方法返回，再在加载后的页面，调用 Pub.Defaults.isReload()刷新页面
		 */
		Pub.f.backReload = function(){
			Pub.cookies();
			Pub.f.setCookie('reload','1',1);
			Pub.f.back();
		}
		/**
		 * 上一个页面更改了数据，并且用history.back()返回到这一个页面，
		 * 用cookie中reload=1通知这个页面重新加载数据
		 */
		Pub.f.isReload = function(f,p){
			Pub.cookies();
			if(Pub.Defaults.getCookie('reload')==1){
				Pub.Defaults.setCookie('reload','0',0);
				if(typeof f == 'function'){
					f(p);
				}else{
					window.location.reload();
				}
			}
		}
		/**
		 * 这里是网页的返回，可以尝试在这里实现一些动态的返回效果
		 */
		Pub.f.back = function(){
			history.back();
		}
		//获取当天剩下的秒数
		Pub.f.getTodayLeftSecond = function(){
			var data=new Date();
			var exdate=new Date(data.getFullYear()+'-'+(data.getMonth()+1)+'-'+(data.getDate()+1));
			var t=exdate.getTime()-data.getTime();
			return t;
		}



		Pub.Defaults.loadCss = function(url){
			Pub.f.loadCss(url);
		};
		Pub.Defaults.loadJs = function(url){
			 Pub.f.loadJs(url);
		};
		Pub.Defaults.showCatchErr = function(e,curScript){
			Pub.f.showCatchErr(e,curScript);
		};
		Pub.Defaults.jsLog = function(msg){
			Pub.f.jsLog(msg);
		};
		Pub.Defaults.loading = function(){
			return Pub.f.loading();
		};
		Pub.Defaults.removeLoading = function(){
			return Pub.f.removeLoading();
		};
		Pub.Defaults.browserInfo = function(){
			return Pub.f.browserInfo();
		}
		Pub.Defaults.backReload = function(){
			Pub.f.backReload();
		}
		Pub.Defaults.isReload = function(){
			Pub.f.isReload();
		}

		//DEBUG DATA BEGIN**************************************
		//$(".imgUl").find("img").eq(0)
		/*console.log(document.getElementsByTagName("img")[0]);
		var base64 = Pub.Defaults.getBase64Image(document.getElementsByTagName("img")[0]);
		console.log(base64);*/
		Pub.Defaults.getBase64Image = function (img) {
			var canvas = document.createElement("canvas");
			canvas.width = img.width;
			canvas.height = img.height;

			var ctx = canvas.getContext("2d");
			ctx.drawImage(img, 0, 0);
			//$("body").append(canvas);
			var dataURL = canvas.toDataURL("image/png");
			//return dataURL;

			// return dataURL.replace("data:image/png;base64,", "");
	    }
		//DEBUG DATA END**************************************
	},
	//启用Pub的cookie方法getCookie(c_name)和setCookie(c_name,value,expiredays)
	cookies:function(){
		/* 	获取cookies值 */
		Pub.f.getCookie = function(c_name){
			if (document.cookie.length>0){
			  	c_start=document.cookie.indexOf(c_name + "=")
			  	if (c_start!=-1){
				    c_start=c_start + c_name.length+1
				    c_end=document.cookie.indexOf(";",c_start)
				    if (c_end==-1) c_end=document.cookie.length
			   		return unescape(document.cookie.substring(c_start,c_end));
			    }
			}
			return "";
		}
		/* 	设置cookie expiredays天 */
		Pub.f.setCookie = function(c_name,value,expiredays,domain){
			var exdate=new Date();
			exdate.setDate(exdate.getDate()+expiredays);
			domain ? domain=';domain='+domain : domain='';
			document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString())+";path=/"+domain;
		}


		Pub.Defaults.getCookie = function(c_name){
			return Pub.f.getCookie(c_name);
		}
		Pub.Defaults.setCookie = function(c_name,value,expiredays,domain){
			Pub.f.setCookie(c_name,value,expiredays,domain);
		}
	},
	//启用app版本号对比
	appVersion:function(){
		//v是要比较的版本号，返回值为boolean，true表示现在的版本大于要比较的版本
		Pub.f.androidGT = function(version){
			Pub.cookies();//启用Pub的cookie方法getCookie(c_name)和setCookie(c_name,value,expiredays)
			version +="";
			var v = Pub.Defaults.getCookie("androidTzwVersion").split("."), n = version.split("");
			if(v[0]>n[0] || v[0]>=n[0]&&v[1]>n[1] || v[0]>=n[0]&&v[1]>=n[1]&&v[2]>n[2]){
				return true;//版本已到
			}else{
				return false;//版本未到
			}
		}
		Pub.f.iosGT = function(version){
			Pub.cookies();//启用Pub的cookie方法getCookie(c_name)和setCookie(c_name,value,expiredays)
			//Pub.Defaults.setCookie("iostzwVersion","1.4.4",360000);
			version +="";
			var v = Pub.Defaults.getCookie("iostzwVersion").split("."), n = version.split("");
			if(v[0]>n[0] || v[0]>=n[0]&&v[1]>n[1] || v[0]>=n[0]&&v[1]>=n[1]&&v[2]>n[2]){
				return true;//版本已到
			}else{
				return false;//版本未到
			}
		}

		Pub.Defaults.androidGT = function(version){
			return Pub.f.androidGT(version);
		}
		Pub.Defaults.iosGT = function(version){
			return Pub.f.iosGT(version);
		}
	}
}
//初始化组件
Pub.initParas();
Pub.init();
Pub.createNew();
