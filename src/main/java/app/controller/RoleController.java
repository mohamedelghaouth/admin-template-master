package app.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import app.model.Functionalities;
import app.model.Roles;
import app.model.USER_PARAM;
import app.model.USER_PARAM_frm;
import app.service.Iroleservice;

@Controller
public class RoleController {
	
	@Autowired
	Iroleservice roleservice;
	
	private static final Logger logger = LoggerFactory.getLogger(RoleController.class);
	private static final Logger admin = LoggerFactory.getLogger("admin");
	
	@ModelAttribute
    public void addAttributes(Model model) {
		Functionalities functionalities=Functionalities.getInctance();
        model.addAttribute("functionalities", functionalities.getFUNCTIONALITIES());
    }
//
//	@RequestMapping(value = "add_role",method = RequestMethod.GET)
//    public String add_Role( @ModelAttribute("role") Roles role,BindingResult result,Model model,Locale locale)
//	    {
//			Date date = new Date();
//			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//			
//			String formattedDate = dateFormat.format(date);
//			model.addAttribute("serverTime", formattedDate );
//			
//			admin.info("going to add role");
//			
//			return "pages/admin/add_Role";
//	    }
//	
//	@RequestMapping(value = "add_role",method = RequestMethod.POST)
//    public String add_Role_Post(@ModelAttribute("role") Roles role,BindingResult result,Model model,Locale locale)
//	    {
//			
//			Date date = new Date();
//			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//			
//			String formattedDate = dateFormat.format(date);
//			model.addAttribute("serverTime", formattedDate );
//				
//			roleservice.Register(role);
//			
//			admin.info(" added  role with name  "+role.getName());
//			
//			return "redirect:index/add_role";
//	    }
//	
	@RequestMapping(value = "delete_role",method = RequestMethod.GET)
	public String delete(@RequestParam Long role_ID) {
	    	
			logger.info("delete_role");	
	    	roleservice.delete(role_ID);
	    	admin.info(" deleted  role with Id  "+role_ID);
	    	return "redirect:index/delete_role"; 	
	    }
	
		/**
		 * * renvoie vers edite
		 */
	@RequestMapping(value = "edit_role", method =RequestMethod.GET)
    public String edite(@RequestParam(required = false) Long role_ID,@ModelAttribute("role") Roles role, Locale locale, Model model) {
			logger.info("go to edite role");
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			Roles new_role =new Roles();
			
			if (role_ID!=null)
				{
					new_role=roleservice.findbyID(role_ID);
			    	admin.info(" editing  role with Id  "+role_ID+"  and name  "+ new_role.getName());

				} 
			else admin.info("demand to add role  ");

			System.out.println(new_role);

			model.addAttribute("role", new_role);
	        
			return "pages/admin/add_Role";
		}
	
	
	/**
	 * *  edite traitement
	 */
	@RequestMapping(value = "edit_role", method =RequestMethod.POST)
    public String edite_post(@Valid @ModelAttribute("role") Roles role,BindingResult result, Locale locale, 
    		Model model) {
			
			logger.info("edite role");
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			Roles new_role =new Roles(role);
			
			if (result.hasErrors()) {
		    	return "pages/admin/add_Role";
			}
			
			if (role.getRole_ID()==null) 
			 	{

		 			if (roleservice.Register(new_role)==null)
					    {
					    	logger.info("the user alresdy existe");
					    	admin.info(" tried to add role that alreay existe");
					    	result.rejectValue("", "error.user_already_exist");
					    	return "pages/admin/add_Role";
					    }
		 			else admin.info(" adding  role with Id  "+new_role.getRole_ID()+"  and name  "+ new_role.getName());
			 	}
		 	else 
			 	{
		 			
		 			new_role.setRole_ID(role.getRole_ID());
		 			 roleservice.update(new_role);
		 			admin.info(" editing  role with Id  "+new_role.getRole_ID()+"  and name  "+ new_role.getName());
				}
	 	
	    return "redirect:index/edit_role";
	        
		}
	
}
