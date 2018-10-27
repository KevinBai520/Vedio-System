package com.model;

/**
 * TPingjia entity. @author MyEclipse Persistence Tools
 */

public class TPingjia implements java.io.Serializable
{

	// Fields

	private Integer id;
	private String neirong;
	private String yinyueId;
	private String shijian;

	// Constructors

	/** default constructor */
	public TPingjia()
	{
	}

	/** full constructor */
	public TPingjia(String neirong, String yinyueId, String shijian)
	{
		this.neirong = neirong;
		this.yinyueId = yinyueId;
		this.shijian = shijian;
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

	public String getNeirong()
	{
		return this.neirong;
	}

	public String getYinyueId() {
		return yinyueId;
	}

	public void setYinyueId(String yinyueId) {
		this.yinyueId = yinyueId;
	}

	public void setNeirong(String neirong)
	{
		this.neirong = neirong;
	}

	public String getyinyueId()
	{
		return this.yinyueId;
	}

	public void setyinyueId(String yinyueId)
	{
		this.yinyueId = yinyueId;
	}

	public String getShijian()
	{
		return this.shijian;
	}

	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

}