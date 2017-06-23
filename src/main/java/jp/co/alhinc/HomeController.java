package jp.co.alhinc;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//DIの恩恵により、Tabako実装クラスを差し替えるだけで吸う銘柄を変更できる。

@Controller
public class HomeController {
	
	@Autowired
	Tabako tabako;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	
	@RequestMapping(value = "smoke", method = RequestMethod.GET)
	public String Smoke(Model model){
		
		model.addAttribute("smokingMessage", tabako.smoking());
		return "home";
	}
	
	
}
