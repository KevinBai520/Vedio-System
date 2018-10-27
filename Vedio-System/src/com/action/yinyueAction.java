package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.THuiyuanDAO;
import com.dao.TYinyueDAO;
import com.model.THuiyuan;
import com.model.TYinyue;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagesize;
import com.util.Pagination;

public class yinyueAction extends ActionSupport
{
	private Integer id;
	private Integer leibieId;
	private String mingcheng;
	private String geshou;
	
	private String jieshao;
	private String fujian;
	private String shijian;
	private Integer dianji;
	
	private String del;
	private Integer huiyuanId;
	
	private TYinyueDAO yinyueDAO;
	private THuiyuanDAO huiyuanDAO;
	
	public String yinyueAdd()
	{
		Map session=ActionContext.getContext().getSession();
		THuiyuan huiyuan=(THuiyuan)session.get("huiyuan");
		
		TYinyue yinyue=new TYinyue();
		
		//yinyue.setId(id);
		yinyue.setLeibieId(leibieId);
		yinyue.setMingcheng(mingcheng);
		yinyue.setGeshou(geshou);
		
		yinyue.setJieshao(jieshao);
		yinyue.setFujian(fujian);
		yinyue.setShijian(shijian);
		yinyue.setDianji(0);
		
		yinyue.setDel("no");
		yinyue.setHuiyuanId(huiyuan.getId());
		
		yinyueDAO.save(yinyue);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息添加成功");
		return "msg";
	}
	
	
	public String yinyueMine()
	{
		Map session=ActionContext.getContext().getSession();
		THuiyuan huiyuan=(THuiyuan)session.get("huiyuan");
		
		String sql="from TYinyue where del='no' and huiyuanId="+huiyuan.getId();
		List yinyueList=yinyueDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<yinyueList.size();i++)
		{
			TYinyue yinyue=(TYinyue)yinyueList.get(i);
			yinyue.setHuiyuan(huiyuanDAO.findById(yinyue.getHuiyuanId()));
		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yinyueList", yinyueList);
		return ActionSupport.SUCCESS;
	}
	
	public String yinyueDel()
	{
		TYinyue yinyue=yinyueDAO.findById(id);
		yinyue.setDel("yes");
		
		yinyueDAO.attachDirty(yinyue);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息删除成功");
		return "msg";
	}
	
	
	
	public String yinyuePre()
	{
		TYinyue yinyue=yinyueDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yinyue", yinyue);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yinyueEdit()
	{
		TYinyue yinyue=yinyueDAO.findById(id);
		
		//yinyue.setId(id);
		yinyue.setLeibieId(leibieId);
		yinyue.setMingcheng(mingcheng);
		yinyue.setGeshou(geshou);
		
		yinyue.setJieshao(jieshao);
		yinyue.setFujian(fujian);
		
		yinyueDAO.attachDirty(yinyue);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "信息更新成功");
		return "msg";
	}
	
	
	public String yinyueMana()
	{
		String sql="from TYinyue where del='no' order by leibieId";
		List yinyueList=yinyueDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<yinyueList.size();i++)
		{
			TYinyue yinyue=(TYinyue)yinyueList.get(i);
			yinyue.setHuiyuan(huiyuanDAO.findById(yinyue.getHuiyuanId()));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yinyueList", yinyueList);
		return ActionSupport.SUCCESS;
	}
	
	public String yinyueNew()
	{
        HttpServletRequest request=ServletActionContext.getRequest();
		
		int index=0;
		if(request.getParameter("index")==null)
		{
			index=1;
		}
		else
		{
			index=Integer.parseInt(request.getParameter("index"));
		}
		
		
		String sql="from TYinyue where del='no' order by id desc";
		List yinyueList=yinyueDAO.getHibernateTemplate().find(sql);
		
		
		
		int fromIndex = (index - 1) * Pagesize.size;
		int toIndex = Math.min(fromIndex + Pagesize.size, yinyueList.size());
		List yinyueList1 = yinyueList.subList(fromIndex, toIndex);
		
		Pagination p = new Pagination();//创建 分页对象
        p.setIndex(index);//设置页数
        p.setPageSize(Pagesize.size);
        p.setTotle(yinyueList.size());//设置总共的条数
        p.setData(yinyueList1);//设置数据
		
		request.setAttribute("page", p);
		request.setAttribute("leibieId", leibieId);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yinyueDetailQian()
	{
		TYinyue yinyue=yinyueDAO.findById(id);
		yinyue.setDianji(yinyue.getDianji()+1);
		
		yinyueDAO.attachDirty(yinyue);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yinyue", yinyue);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String yinyueByLeibie()
	{
		String sql="from TYinyue where del='no' and leibieId=?";
		Object[] con={leibieId};
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		List yinyueList=yinyueDAO.getHibernateTemplate().find(sql,con);
		request.put("yinyueList", yinyueList);
		
		System.out.println(yinyueList.size()+"&&");
		
		return ActionSupport.SUCCESS;
	}
	
	
	public String yinyueRes()
	{
		String sql="from TYinyue where del='no' and mingcheng like '%"+mingcheng.trim()+"%'"+" and geshou like '%"+geshou.trim()+"%'";

		List yinyueList=yinyueDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yinyueList", yinyueList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String yinyueDianji()
	{
		String sql="from TYinyue where del='no' order by dianji desc";
		List yinyueList=yinyueDAO.getHibernateTemplate().find(sql);
		if(yinyueList.size()>10)
		{
			yinyueList=yinyueList.subList(0, 10);
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("yinyueList", yinyueList);
		return ActionSupport.SUCCESS;
	}


	public Integer getId()
	{
		return id;
	}


	public void setId(Integer id)
	{
		this.id = id;
	}


	public Integer getDianji() {
		return dianji;
	}


	public THuiyuanDAO getHuiyuanDAO() {
		return huiyuanDAO;
	}


	public void setHuiyuanDAO(THuiyuanDAO huiyuanDAO) {
		this.huiyuanDAO = huiyuanDAO;
	}


	public void setDianji(Integer dianji) {
		this.dianji = dianji;
	}


	public Integer getHuiyuanId() {
		return huiyuanId;
	}


	public void setHuiyuanId(Integer huiyuanId) {
		this.huiyuanId = huiyuanId;
	}


	public Integer getLeibieId()
	{
		return leibieId;
	}


	public String getShijian()
	{
		return shijian;
	}


	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}


	public void setLeibieId(Integer leibieId)
	{
		this.leibieId = leibieId;
	}


	public String getMingcheng()
	{
		return mingcheng;
	}


	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}


	public String getGeshou()
	{
		return geshou;
	}


	public void setGeshou(String geshou)
	{
		this.geshou = geshou;
	}


	public String getJieshao()
	{
		return jieshao;
	}


	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}


	public String getFujian()
	{
		return fujian;
	}


	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}


	public String getDel()
	{
		return del;
	}


	public void setDel(String del)
	{
		this.del = del;
	}


	public TYinyueDAO getYinyueDAO()
	{
		return yinyueDAO;
	}


	public void setYinyueDAO(TYinyueDAO yinyueDAO)
	{
		this.yinyueDAO = yinyueDAO;
	}

}
