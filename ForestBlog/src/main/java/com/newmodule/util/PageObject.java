package com.newmodule.util;

import java.io.Serializable;
import java.util.List;
/**
 * 封装值的对象,封装分页信息以及当前数据
 * @author 刘檀
 *
 * @param <T>
 */
public class PageObject<T> implements Serializable {
	
	private static final long serialVersionUID = -4288938782658423221L;
	/**当前页的页码值*/
	private Integer pageCurrent=1;
	/**页面大小*/
	private Integer pageSize=3;
	/**总行数(通过查询获得)*/
	private Integer rowCount=0;
	/**总页数(通过计算获得)*/
	private Integer pageCount=0;
	/**当前页记录*/
	private List<T> records;
	public Integer getPageCurrent() {
		return pageCurrent;
	}
	public void setPageCurrent(Integer pageCurrent) {
		this.pageCurrent = pageCurrent;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getRowCount() {
		return rowCount;
	}
	public void setRowCount(Integer rowCount) {
		this.rowCount = rowCount;
	}

	public Integer getPageCount() {
		//计算总页数，为什么会在此方法进行计算
		//将对象转换为json串时底层调用的是对象的get方法
		pageCount=rowCount/pageSize;
		if(rowCount%pageSize!=0){//多余的一条或两条 总页数+1
			pageCount++;
		}
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;


	}
	public List<T> getRecords() {
		return records;
	}
	public void setRecords(List<T> records) {
		this.records = records;
	} 
}
