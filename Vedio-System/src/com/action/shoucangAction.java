package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TShoucangDAO;
import com.dao.TYinyueDAO;
import com.model.THuiyuan;
import com.model.TShoucang;
import com.model.TYinyue;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class shoucangAction extends ActionSupport
{
	private Integer id;
	private Integer yinyueId;
	private String shijian;
	private Integer huiyuanId;
	
	
	private TShoucangDAO shoucangDAO;
	private TYinyueDAO yinyueDAO;
	
	private String message;
	private String path;
	
	public String shoucangAdd()
	{
		Map session=ActionContext.getContext().getSession();
		THuiyuan huiyuan=(THuiyuan)session.get("huiyuan");
		
		String sql="from TShoucang where yinyueId=? and huiyuanId=?";
		Object[] c={yinyueId,huiyuan.getId()};
		List list=shoucangDAO.getHibernateTemplate().find(sql,c);
		if(list.size()>0)
		{
			this.setMessage("您已经收藏该视频，请不要重复收藏");
			this.setPath("index.action");
			return "succeed";
		}
		
		TShoucang shoucang=new TShoucang();
		
		//shoucang.setId(id);
		shoucang.setYinyueId(yinyueId);
		shoucang.setShijian(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		shoucang.setHuiyuanId(huiyuan.getId());
		
		shoucangDAO.save(shoucang);
		
		this.setMessage("已加入到收藏夹，请点击我的收藏夹查看");
		this.setPath("index.action");
		return "succeed";
		
	}
	
	public String shoucangMine()
	{
		Map session=ActionContext.getContext().getSession();
		THuiyuan huiyuan=(THuiyuan)session.get("huiyuan");
		
		String sql="from TShoucang where huiyuanId="+huiyuan.getId();
		List shoucangList=shoucangDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<shoucangList.size();i++)
		{
			TShoucang shoucang=(TShoucang)shoucangList.get(i);
			shoucang.setYinyue(yinyueDAO.findById(shoucang.getYinyueId()));
		}
		
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shoucangList", shoucangList);
		return ActionSupport.SUCCESS;
	}
	
	public String shoucangDel()
	{
		TShoucang shoucang=shoucangDAO.findById(id);
		shoucangDAO.delete(shoucang);
		
		this.setMessage("删除完毕");
		this.setPath("shoucangMine.action");
		return "succeed";
	}
	
	
	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getYinyueId()
	{
		return yinyueId;
	}

	public void setYinyueId(Integer yinyueId)
	{
		this.yinyueId = yinyueId;
	}

	public String getShijian()
	{
		return shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

	public Integer getHuiyuanId()
	{
		return huiyuanId;
	}

	public void setHuiyuanId(Integer huiyuanId)
	{
		this.huiyuanId = huiyuanId;
	}

	public TShoucangDAO getShoucangDAO()
	{
		return shoucangDAO;
	}

	public void setShoucangDAO(TShoucangDAO shoucangDAO)
	{
		this.shoucangDAO = shoucangDAO;
	}

	public TYinyueDAO getYinyueDAO()
	{
		return yinyueDAO;
	}

	public void setYinyueDAO(TYinyueDAO yinyueDAO)
	{
		this.yinyueDAO = yinyueDAO;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	
}
