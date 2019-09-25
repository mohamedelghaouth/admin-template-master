package app.service.impl;

import java.util.ArrayList;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import app.dao.Iuserdao;
import app.model.USER_PARAM;
import app.service.Iuserservice;

@Service
@Transactional
public class Userserviceimpl implements Iuserservice {

	@Autowired
	Iuserdao userdao;
	
	private String hashPassword(String plainTextPassword){
		return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
	}
	
	private boolean checkPass(String plainPassword, String hashedPassword) {
		if (BCrypt.checkpw(plainPassword, hashedPassword))
			return true;
		else
			return false;
	}
	
	public USER_PARAM Register(USER_PARAM user) 
	{
		//recuperation des enregistrement
		ArrayList<USER_PARAM> User_List = (ArrayList<USER_PARAM>) userdao.getAll();
		
		//verification: pour eviter des enregistrement identique
		for (USER_PARAM user_PARAM : User_List)
		{
			//si USER_NAME est identique
			if (user_PARAM.getUSER_NAME().equals(user.getUSER_NAME())) 
			{
				//verification de l'identification des passwords
				if (checkPass(user.getUSER_PASSWORD(), user_PARAM.getUSER_PASSWORD()))
				{
					// return null
					return null;
				}
			}
			
		}
		
		//dans le cas d'aucun redondance de nom
		
		//hashing password
		user.setUSER_PASSWORD(hashPassword(user.getUSER_PASSWORD()));
		
		// persistence du nouveau utilisateur
		userdao.create(user);
		//ramener l'objet enregistrer
		return user;
	}

	public USER_PARAM login(USER_PARAM user)
	{
		//recuperation des enregistrement
		ArrayList<USER_PARAM> User_List = (ArrayList<USER_PARAM>) userdao.getEntityByColValue("USER_PARAM","USER_NAME",user.getUSER_NAME());
				
		//parcour des enregistrement
		for (USER_PARAM user_PARAM : User_List)
		{
			
					//verification de l'identification des passwords
					if (checkPass(user.getUSER_PASSWORD(), user_PARAM.getUSER_PASSWORD()))
					{
						
						//user point sur l'enregitrement identifier
						user=user_PARAM;
						System.out.println(user);
						// ramener l'utilsateur identifier
						return user;
					}
					
		}
		// si on trouve rien on ramene : NULL
		return null;
	}
	
	public ArrayList<USER_PARAM> getALL() {
		 
		ArrayList<USER_PARAM> userlist=new ArrayList<USER_PARAM>();
		
		userlist=(ArrayList<USER_PARAM>) userdao.getAll();
		
		return userlist;
	}

	public void delete(Long user_ID) {
		
		userdao.delete(user_ID);
		
	}
	
	public void update(USER_PARAM user) {
		
		userdao.update(user);
	}

	public USER_PARAM findbyID(Long user_ID) {
		
		return userdao.findById(user_ID);
				 
	}

}
