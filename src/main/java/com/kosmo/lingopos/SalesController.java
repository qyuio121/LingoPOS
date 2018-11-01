package com.kosmo.lingopos;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesController {
	
	@RequestMapping("/Shop/Sales.Lingo")
	public String sales() throws Exception{
		
		
		return "shop/sales/sales.tiles";
	}
}
