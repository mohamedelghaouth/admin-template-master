package app.dao.impl;

import org.springframework.stereotype.Repository;

import app.dao.Iroledao;
import app.dao.daoGenerique.impl.HibernateSpringGenericDaoImpl;
import app.model.Roles;

@Repository
public class Rolesdaoimpl extends HibernateSpringGenericDaoImpl<Roles, Long> implements Iroledao  {

	public Rolesdaoimpl() {
		super(Roles.class);
	}

	
	
}
