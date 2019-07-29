package app.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import app.model.USER_PARAM;
import app.model.USER_PARAM_frm;
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
	
	
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		
		@ModelAttribute
	    public void addAttributes(Model model) {
			USER_PARAM user = new USER_PARAM();
	        model.addAttribute("user", user);
	    }
		
	
		/**
		 * Simply selects the home view to render by returning its name.
		 */
		@RequestMapping(value = { "/","/home"}, method =RequestMethod.GET)
		public String home(Locale locale, Model model) {
			logger.info("Welcome home! : login page");
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			
			return "pages/login";
		}
		
	
		  /**
		   * do the login treatment
		   * 
		   * @param user
		   * @param result
		   * @param status
		   * @return redirect to index method
		   */
	 @RequestMapping(value = "/login",method = RequestMethod.POST)
	    public String login(@Valid @ModelAttribute("user") USER_PARAM user,
	                            BindingResult result, SessionStatus status,Model model,
	                            HttpSession session)
	    {
		 
		 logger.info("login treatment");
		 //Validation code start
		    boolean error = false;
		   
		    System.out.println(user);
		    //on verifie est ce que les champs sont pas vide
		    
		    if (result.hasErrors()) {
		    	return "redirect:/";
			}
		    
//		    //user name
//		    if(user.getUSER_NAME().isEmpty()){
//		    	logger.info("username emty");
//		        result.rejectValue("USER NAME", "error.USER_NAME");
//		        error = true;
//		    }
//		     // user password
//		    if(user.getUSER_PASSWORD().isEmpty()){
//		    	logger.info("userpasswd emty");
//		        result.rejectValue("USER PASSWORD", "error.USER_PASSWORD");
//		        error = true;
//		    }
//		    
//		    // si error est true: on renvoie vers la page login avec des message d'erreur 
//		    if(error) {  
//		    	logger.info("field emty");
//		    	return "redirect:/";
//		    	}
//		    
//		    
		    user=userservice.login(user);
		    
		    // si un enregistrement identique est deja presen : on renvoie vers la page login avec des message d'erreur 
		    if (user==null) {  
		    	logger.info("no user identified");
		    	return "redirect:/";}	
			
		    
		    // si l'aithentification a marcher : on renvoie vers la page index
		    else {
		    	System.out.println(user);
		    	  session.setAttribute("user", user);
		    	return "redirect:index";
		    	}
		    
	        
	    }
	
	 	/**
	 	 * 
	 	 * do the register treatmnet
	 	 * @param user
	 	 * @param result
	 	 * @param status
	 	 * @return
	 	 */
		 @RequestMapping(value = "register",method = RequestMethod.POST)
	    public String register(@ModelAttribute("user_frm") USER_PARAM_frm user,
		                            BindingResult result, SessionStatus status,Model model)
		    {
			 
			    if(!user.getUSER_PASSWORD().equals(user.getConfpsswd()))
			    {    
			    	logger.info("password not confirmed");
			    	return "redirect:registrer";
			    }  
			    
			    USER_PARAM user2 = new USER_PARAM();
			    user2.setUSER_NAME(user.getUSER_NAME());
			    user2.setUSER_PASSWORD(user.getUSER_PASSWORD());
			    		    
			    if (userservice.Register(user2)==null)
			    {
			    	logger.info("the user alresdy existe");
			    	return "redirect:registrer";
			    }	
				
			    
			    else 
			    {
			    	logger.info("redirect to :login");
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
		        				
				
				return "pages/register";
			}

		
		/**
		 * renvoie vers index
		 * 
		 * @param locale
		 * @param model
		 * @return
		 */
	    @RequestMapping(value = "/index", method =RequestMethod.GET)
	    public String index(@ModelAttribute("userlist") ArrayList<USER_PARAM> userlist, Locale locale, Model model,HttpSession session) {
			logger.info("Welcome to index");
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			
			
			
			System.out.println(session.getAttribute("user"));
			USER_PARAM user = (USER_PARAM) session.getAttribute("user");

		
			if (user.getUSER_TYPE().equals("adm"))
				{
				
				userlist=userservice.getALL();
				
				model.addAttribute("userlist", userlist);
				
				return "pages/admin/index";
				}
				
			else  return "index";
			
			
		}

	    @RequestMapping(value = "delete",method = RequestMethod.GET)
	    public String delete(@RequestParam Long user_ID) {
	    	logger.info("delete");
	    	
	    	userservice.delete(user_ID);
	    	
	    	return "redirect:index";
	    	
	    }
	    
	    /**
	     * * renvoie vers edite
		 */
		@RequestMapping(value = "edite", method =RequestMethod.GET)
	    public String edite(@RequestParam Long user_ID,@ModelAttribute("user_frm") USER_PARAM_frm user_frm, Locale locale, Model model) {
				logger.info("go to edite");
				
				Date date = new Date();
				DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
				
				String formattedDate = dateFormat.format(date);
				model.addAttribute("serverTime", formattedDate );
				
				USER_PARAM user =new USER_PARAM();
				user=userservice.findbyID(user_ID);
				user_frm.setUSER_ID(user_ID);
				user_frm.setUSER_NAME(user.getUSER_NAME());
				user_frm.setUSER_TYPE(user.getUSER_TYPE());
				user_frm.setUSER_PASSWORD(user.getUSER_PASSWORD());
				 System.out.println(user_frm);
				 System.out.println("---------------------------------------------");
				model.addAttribute("user_frm", user_frm);
		        				
				
				return "pages/admin/edite_user";
			}

		/**
	 	 * 
	 	 * do the register treatmnet
	 	 * @param user
	 	 * @param result
	 	 * @param status
	 	 * @return
	 	 */
		 @RequestMapping(value = "edite",method = RequestMethod.POST)
	    public String edite(@ModelAttribute("user_frm") USER_PARAM_frm user,
		                            BindingResult result, SessionStatus status,Model model)
		    {
			 
			 System.out.println(user);
			 
			    if(!user.getUSER_PASSWORD().equals(user.getConfpsswd()))
			    {    
			    	logger.info("password not confirmed");
			    	return "redirect:edite?user_ID="+user.getUSER_ID();
			    }  
			    
			    USER_PARAM user2 = new USER_PARAM();
			    user2.setUSER_ID(user.getUSER_ID());
			    user2.setUSER_NAME(user.getUSER_NAME());
			    user2.setUSER_PASSWORD(user.getUSER_PASSWORD());
			    user2.setUSER_TYPE(user.getUSER_TYPE());
			    
			    userservice.update(user2);
			    
			    return "redirect:index";	   
		        
		    }

		
}
