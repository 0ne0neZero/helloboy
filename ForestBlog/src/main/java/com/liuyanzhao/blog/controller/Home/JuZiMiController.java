package com.liuyanzhao.blog.controller.Home;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liuyanzhao.blog.entity.custom.JuZiMiDesc;
import com.liuyanzhao.blog.service.JzdService;
/**
 * www.juzimi.com信息入库
 * @author 刘檀
 *
 */
@Controller
public class JuZiMiController {
	
	
	@Autowired
	private JzdService jzdService;
	/**
	 * 步骤1:
	 * 	1.电影台词首页信息
	 * 		1.1 获取分页数,首页地址拼接,每页内容入库
	 * 	2.电影名称a便签链接拼接后入库
	 * 	建类pojo属性内容:
	 * 		movieName/descText/nums/
	 */
	@RequestMapping("/savemovie")
	public void insertIndex() {
		List<JuZiMiDesc> list = new ArrayList<JuZiMiDesc>();
		//声明爬取的网站地址
		String indexUrl = "http://www.juzimi.com/allarticle/jingdiantaici?page=";
		for(int i=0;i<5;i++) {
			String indexUrls = indexUrl+i;
			list.addAll(getAll(indexUrls));
		}
		//将list存储到DB
		jzdService.insertJZD(list);
		
	}
	public List<JuZiMiDesc> getAll(String url) {
		
		List<JuZiMiDesc> content = new ArrayList<JuZiMiDesc>();
		
		try {
			Document doc = Jsoup.connect(url)
					.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0")	
					.timeout(4000).get();
			
			Elements imgels = doc.select(".views-field-tid img");//电影图片
			Elements names = doc.select(".xqallarticletilelinkspan");//电影名
			Elements descs = doc.select(".xqagepawirdesc");//电影描述
			Elements nums = doc.select(".xqagepawirdesclink");//台词总数
			Elements hrefs = doc.select(".views-field-tid a");//二级链接,需后续拼接
			
			String aurl = "http://www.juzimi.com";//拼接二级链接使用
			
			for(int i=0;i<imgels.size();i++) {//每个元素的数量都相同,所以已一个元素的总数值为遍历条件就可以了
				
				JuZiMiDesc jzd = new JuZiMiDesc();
				//从元素里边取出目标信息,对应上边注释
				String imgurl = imgels.eq(i).attr("src");
				String title = names.eq(i).text();
				String desc = descs.eq(i).html();
				String num = nums.eq(i).text();
				
				//每个详情页的地址
				String href = hrefs.eq(i).attr("href");//之前少写个EQ,网址打印出来是每一页的第一个,20个一重复,100条
				String jumpurl = aurl+href;//拼接:每个2级栏目的网址,100个
				System.out.println(jumpurl);
				
				//设置
				jzd.setImgurl(imgurl);
				jzd.setMovietitle(title);
				jzd.setMoviedesc(desc);
				jzd.setMovienum(num);
				//设置详情页地址,二级菜单爬取会用到
				jzd.setMoviejumpurl(jumpurl);
				//
				System.out.println(jumpurl);
				//ig.setContenttxt(secondContent(jumpurl));//返回的是 文字内容
				//添加进去,集合用add,集合跟数组不同
				content.add(jzd);
			}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return content;
	}
	/**
	 * 步骤2:
	 * 	1.
	 */
	
}
