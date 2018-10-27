package com.model;

/**
 * TYinyue entity. @author MyEclipse Persistence Tools
 */

public class TYinyue implements java.io.Serializable
{

	// Fields

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
	
	private THuiyuan huiyuan;

	// Constructors

	/** default constructor */
	public TYinyue()
	{
	}

	/** full constructor */
	public TYinyue(Integer leibieId, String mingcheng, String jieshao,
			String fujian, String del)
	{
		this.leibieId = leibieId;
		this.mingcheng = mingcheng;
		this.jieshao = jieshao;
		this.fujian = fujian;
		this.del = del;
	}

	// Property accessors

	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getDianji()
	{
		return dianji;
	}

	public Integer getHuiyuanId() {
		return huiyuanId;
	}

	public void setHuiyuanId(Integer huiyuanId) {
		this.huiyuanId = huiyuanId;
	}

	public THuiyuan getHuiyuan() {
		return huiyuan;
	}

	public void setHuiyuan(THuiyuan huiyuan) {
		this.huiyuan = huiyuan;
	}

	public void setDianji(Integer dianji)
	{
		this.dianji = dianji;
	}

	public Integer getLeibieId()
	{
		return this.leibieId;
	}

	public String getGeshou()
	{
		return geshou;
	}

	public String getShijian()
	{
		return shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

	public void setGeshou(String geshou)
	{
		this.geshou = geshou;
	}

	public void setLeibieId(Integer leibieId)
	{
		this.leibieId = leibieId;
	}

	public String getMingcheng()
	{
		return this.mingcheng;
	}

	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}

	public String getJieshao()
	{
		return this.jieshao;
	}

	public void setJieshao(String jieshao)
	{
		this.jieshao = jieshao;
	}

	public String getFujian()
	{
		return this.fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public String getDel()
	{
		return this.del;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

}