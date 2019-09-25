package app.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import app.model.Roles;
import app.model.USER_PARAM;
import app.model.USER_PARAM_frm;
import app.service.Iroleservice;
import app.service.Iuserservice;

/**
 * Handles requests for the application home page.
 */
/**
 * @author TechnologieInf
 *
 */
@Controller
@ControllerAdvice
public class HomeController {
	
	
	@Autowired
	Iuserservice userservice;
	@Autowired
	Iroleservice roleservice;
	
	
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		private static final Logger admin = LoggerFactory.getLogger("admin");
		
		
		@ModelAttribute
	    public void addAttributes(Model model) {
			USER_PARAM user = new USER_PARAM();
	        model.addAttribute("user", user);
	    }
		
	//-----------------login-------------------------------------
		/**
		 * Simply selects the home view to render by returning its name.
		 */
		@RequestMapping(value = { "/","/home"}, method =RequestMethod.GET)
		public String home(Locale locale, Model model, HttpSession session) {
			logger.info("Welcome home! : login page");
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			USER_PARAM user= (USER_PARAM) session.getAttribute("user");
			if (user!=null) {
				admin.info("User "+ user.getUSER_NAME()+"  loged  out");
			}
			
			session.invalidate();
			
			return "pages/login";
		}
		
		@RequestMapping(value = { "welcome"}, method =RequestMethod.GET)
		public String welcome(Locale locale, Model model, HttpSession session) {
			logger.info("Welcome home! : blanck page");
			admin.info("got to welckom page");
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			return "pages/blank";
		}
		
		  /**
		   * do the login treatment
		   * 
		   * @param user
		   * @param result
		   * @param status
		   * @return redirect to index method
		   */
	 @RequestMapping(value = "/login",method = {RequestMethod.POST,RequestMethod.GET})
	    public String login(@Valid @ModelAttribute("user") USER_PARAM user,
	                            BindingResult result, HttpSession session)
	    {
		 
		 logger.info("login treatment");
		 //Validation code start
		    boolean error = false;
		
		    //on verifie est ce que les champs sont pas vide
		    
		    if (result.hasErrors()) {
		    	return "pages/login";
			}
  
		    user=userservice.login(user);
		    
		    // si un enregistrement identique est deja presen : on renvoie vers la page login avec des message d'erreur 
		    if (user==null) {  
		    	logger.info("no user identified");
		    	return "redirect:/";
		    	}	
			
		    
		    // si l'aithentification a marcher : on renvoie vers la page index
		    else {
		    	System.out.println(user);
		    	admin.info("User "+ user.getUSER_NAME()+"  loged  in");
		    	session.setAttribute("user", user);
		    	return "pages/blank";
		    	}
		    
	        
	    }
	//-----------------/login----------------------------------------

	//-----------------register-------------------------------------
	 	/**
	 	 * 
	 	 * do the register treatmnet
	 	 * @param user
	 	 * @param result
	 	 * @param status
	 	 * @return
	 	 */
		 @RequestMapping(value = "register",method = RequestMethod.POST)
	    public String register(@Valid @ModelAttribute("user_frm") USER_PARAM_frm user,BindingResult result)
		    {
			 
			    if (result.hasErrors())  return "pages/register";
			   
			    if(!user.getUSER_PASSWORD().equals(user.getConfpsswd()))
			    {    
			    	logger.info("password not confirmed");
			    	result.rejectValue("", "error.mot_depasse_not_conf");
			    	return "pages/register";
			    }  
			    
			    USER_PARAM user2 = new USER_PARAM();
			    user2.setUSER_NAME(user.getUSER_NAME());
			    user2.setUSER_PASSWORD(user.getUSER_PASSWORD());
			    		    
			    if (userservice.Register(user2)==null)
			    {
			    	logger.info("the user alresdy existe");
			    	admin.info(user2.getUSER_NAME()+ "   tried to register again");
			    	result.rejectValue("", "error.user_already_exist");
			    	return "pages/register";
			    }	
				
			    
			    else 
			    {
			    	logger.info("redirect to :login");
			    	admin.info(user2.getUSER_NAME()+ "   created an acount");
			    	return "redirect:/";
			    }    
		        
		    }
		
		/**
		 * renvoie vers register
		 */
		@RequestMapping(value = "register", method =RequestMethod.GET)
	    public String register(Locale locale, Model model) {
				logger.info("go to register");
				
				Date date = new Date();
				DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				
				String formattedDate = dateFormat.format(date);
				model.addAttribute("serverTime", formattedDate );
				
				USER_PARAM_frm user = new USER_PARAM_frm();
		        model.addAttribute("user_frm", user);
		        				
		        admin.info(" asking to register");
		        
				return "pages/register";
			}

	//-----------------/register-------------------------------------	
		
	//-----------------index-------------------------------------	
		
		/**
		 * renvoie vers index
		 * 
		 * @param locale
		 * @param model
		 * @return
		 */
	    @RequestMapping(value = "/index/{param}", method =RequestMethod.GET)
	    public String index(@PathVariable("param") String param,@ModelAttribute("userlist") ArrayList<USER_PARAM> userlist,
	    		@ModelAttribute("rolelist") ArrayList<Roles> rolelist,
	    		Locale locale,Model model,HttpSession session) {
			logger.info("Welcome to index");
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			System.out.println(session.getAttribute("user"));
			USER_PARAM user = (USER_PARAM) session.getAttribute("user");
		
			if(param.contains("user")) 
			{
				String user_table="user_table";
				model.addAttribute("user_table", user_table);
				userlist=userservice.getALL();
				model.addAttribute("userlist", userlist);
					
			}
			if(param.contains("role")) 
			{
				String role_table="role_table";
				model.addAttribute("role_table", role_table);
				
				rolelist=roleservice.getALL();
				model.addAttribute("rolelist", rolelist);
			}
			
				return "pages/admin/index";
			
		}

	//-----------------/index-------------------------------------  
	    
	 //------------------/edite||delete-----------------------------------------
	    /**
	     * * renvoie vers edite
		 */
		@RequestMapping(value = "edit", method =RequestMethod.GET)
	    public String edite(@RequestParam(required = false,value = "user_ID") Long user_ID,@ModelAttribute("user_frm") USER_PARAM_frm user_frm, Locale locale, Model model) {
				logger.info("go to edite");
				
				Date date = new Date();
				DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				
				String formattedDate = dateFormat.format(date);
				model.addAttribute("serverTime", formattedDate );
				
				List<Roles> roles=new ArrayList<Roles>();
				USER_PARAM user =new USER_PARAM();
				
				if (user_ID!=null)
					{
						user=userservice.findbyID(user_ID);
						user_frm=new USER_PARAM_frm(user);
						admin.info("editing user  " +user.getUSER_NAME() +"  with ID  "+ user.getUSER_ID());
					} 
				else admin.info("adding a user");
				
				roles=roleservice.getALL();
				
				model.addAttribute("user_frm", user_frm);
				model.addAttribute("roles", roles);
				
				return "pages/admin/edite_user";
			}

		/**
	 	 * 
	 	 * do the edite treatmnet
	 	 * @param user
	 	 * @param result
	 	 * @param status
	 	 * @return
	 	 */
		 @RequestMapping(value = "edit",method = RequestMethod.POST)
	    public String edite(@Valid @ModelAttribute("user_frm") USER_PARAM_frm user,
		                            BindingResult result, SessionStatus status,Model model)
		    {
			 
			 	logger.info("edite post");
			 	
			 	if (result.hasErrors()) 
			 	{  
			 		List<Roles> roles=new ArrayList<Roles>();
			 		roles=roleservice.getALL();
			 		model.addAttribute("roles", roles);
			 		return "pages/admin/edite_user";
			 	}
			 	
			 	if(!user.getUSER_PASSWORD().equals(user.getConfpsswd()))
			    {    
			    	logger.info("password not confirmed");
			    	result.rejectValue("", "error.mot_depasse_not_conf");
			    	List<Roles> roles=new ArrayList<Roles>();
			 		roles=roleservice.getALL();
			 		model.addAttribute("roles", roles);
			 		return "pages/admin/edite_user";
			    	
			    }
			 	
			 	USER_PARAM user2 = new USER_PARAM(user);
			 	
			 	Long id=user.getRole().getRole_ID();
	 			user2.setRole(roleservice.findbyID(id));
			 	
			 	if (user.getUSER_ID()==null) 
				 	{
			 			
				 		   
			 			
			 			if (userservice.Register(user2)==null)
						    {
						    	logger.info("the user alresdy existe");
						    	admin.info("adding a user that already exist with name   "+user2.getUSER_NAME());
						    	result.rejectValue("", "error.user_already_exist");
						    	List<Roles> roles=new ArrayList<Roles>();
						    	roles=roleservice.getALL();
						    	model.addAttribute("roles", roles);
						    	return "pages/admin/edite_user";
						    }
			 			else admin.info("adding a user with name   "+user2.getUSER_NAME());
				 	}
			 	else 
				 	{
			 			System.out.println(user.getUSER_ID());
			 			user2.setUSER_ID(user.getUSER_ID());
			 			userservice.update(user2);
			 			admin.info("editing the user with name   "+user2.getUSER_NAME()+"  and ID  "+user.getUSER_ID());
					}
			 	
			    return "redirect:index/user";	   
		        
		    }

		@RequestMapping(value = "delete",method = RequestMethod.GET)
		public String delete(@RequestParam Long user_ID) {
		    	logger.info("delete");
		    	
		    	userservice.delete(user_ID);
		    	admin.info("deleting the user with ID    "+user_ID);
		    	
		    	return "redirect:index/user";
		    	
		    }
		 
	//-----------------/edite||delete-----------------------------------------
}
