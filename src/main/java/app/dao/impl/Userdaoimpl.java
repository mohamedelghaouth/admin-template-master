package app.dao.impl;


import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import app.dao.Iuserdao;
import app.dao.daoGenerique.impl.HibernateSpringGenericDaoImpl;
import app.model.USER_PARAM;

@Repository
public class Userdaoimpl extends HibernateSpringGenericDaoImpl<USER_PARAM, Long> implements Iuserdao  {

	public Userdaoimpl() {
		super(USER_PARAM.class);
	}

}
