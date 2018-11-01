package com.kosmo.lingopos;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosmo.lingopos.sale.SaleService;
import com.kosmo.lingopos.saleslist.SaleslistService;

@Controller
public class SalesController {
//	@Resource(name="saleService")
//	private SaleService saleService;
//	@Resource(name="saleslistService")
//	private SaleslistService saleslistService;
//	
	@RequestMapping("/Shop/Sales.Lingo")
	public String sales() throws Exception{
		
		
		return "shop/sales/sales.tiles";
	}
}
