package app.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.dao.Iroledao;
import app.dao.Iuserdao;
import app.model.Roles;
import app.model.USER_PARAM;
import app.service.Iroleservice;

@Service
@Transactional
public class Roleserviceimpl implements Iroleservice {

	@Autowired
	Iroledao roledao;
	
	@Autowired
	Iuserdao userdao;
	
 	public ArrayList<Roles> getALL() {
		ArrayList<Roles> roleslist=new ArrayList<Roles>();
		roleslist=(ArrayList<Roles>) roledao.getAll();
		return roleslist;
	}

	public Roles Register(Roles role) {
		
		roledao.create(role);
		return role;
	}

	public void delete(Long Role_ID) {
		
		Roles role=new Roles(findbyID(Role_ID));
		
		for (USER_PARAM user : role.getUsers()) {
			user.setRole(null);
			userdao.update(user);
		}
		
		roledao.delete(Role_ID);
	}

	public Roles findbyID(Long role_ID) {
		return roledao.findById(role_ID);
	}

	public void update(Roles role) {
		
		roledao.update(role);
	}

}
