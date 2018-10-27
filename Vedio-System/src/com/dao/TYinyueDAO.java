package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TYinyue;

/**
 * A data access object (DAO) providing persistence and search support for
 * TYinyue entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.model.TYinyue
 * @author MyEclipse Persistence Tools
 */

public class TYinyueDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TYinyueDAO.class);
	// property constants
	public static final String LEIBIE_ID = "leibieId";
	public static final String MINGCHENG = "mingcheng";
	public static final String JIESHAO = "jieshao";
	public static final String FUJIAN = "fujian";
	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TYinyue transientInstance)
	{
		log.debug("saving TYinyue instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TYinyue persistentInstance)
	{
		log.debug("deleting TYinyue instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TYinyue findById(java.lang.Integer id)
	{
		log.debug("getting TYinyue instance with id: " + id);
		try
		{
			TYinyue instance = (TYinyue) getHibernateTemplate().get(
					"com.model.TYinyue", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TYinyue instance)
	{
		log.debug("finding TYinyue instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TYinyue instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TYinyue as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLeibieId(Object leibieId)
	{
		return findByProperty(LEIBIE_ID, leibieId);
	}

	public List findByMingcheng(Object mingcheng)
	{
		return findByProperty(MINGCHENG, mingcheng);
	}

	public List findByJieshao(Object jieshao)
	{
		return findByProperty(JIESHAO, jieshao);
	}

	public List findByFujian(Object fujian)
	{
		return findByProperty(FUJIAN, fujian);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TYinyue instances");
		try
		{
			String queryString = "from TYinyue";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TYinyue merge(TYinyue detachedInstance)
	{
		log.debug("merging TYinyue instance");
		try
		{
			TYinyue result = (TYinyue) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TYinyue instance)
	{
		log.debug("attaching dirty TYinyue instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TYinyue instance)
	{
		log.debug("attaching clean TYinyue instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TYinyueDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TYinyueDAO) ctx.getBean("TYinyueDAO");
	}
}