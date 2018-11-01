package com.kosmo.lingopos;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.lingopos.foodimg.FoodimgDTO;
import com.kosmo.lingopos.foodimg.FoodimgService;
import com.kosmo.lingopos.login.LoginDTO;
import com.kosmo.lingopos.sale.SaleDTO;
import com.kosmo.lingopos.sale.SaleService;
import com.kosmo.lingopos.saleslist.SaleslistService;

@Controller
public class SalesController {
	@Resource(name="saleService")
	private SaleService saleService;
	@Resource(name="saleslistService")
	private SaleslistService saleslistService;
	@Resource(name="foodimgService")
	private FoodimgService foodimgService;
	
	
	
	
	@RequestMapping("/Shop/Sales.Lingo")
	public String sales(@RequestParam Map map,HttpSession session,Model model) throws Exception{
		LoginDTO dto = (LoginDTO)session.getAttribute("loginDTO");
		map.put("storeno", dto.getStoreno());
		//금일 매출액구하기
		List list = saleService.selectDay(map);
		for(Object value: list) {
			if(map.get("day") != null) {
				map.put("day", Integer.parseInt(map.get("day").toString())+((SaleDTO)value).getSalesprice());
			}
			else {
				map.put("day", ((SaleDTO)value).getSalesprice());
			}
		}
		map.put("day", map.get("day").toString()+"원");
		//월 총 매출액구하기
		list = saleService.selectMonth(map);
		for(Object value: list) {
			if(map.get("month") != null) {
				map.put("month", Integer.parseInt(map.get("month").toString())+((SaleDTO)value).getSalesprice());
			}
			else {
				map.put("month", ((SaleDTO)value).getSalesprice());
			}
		}
		map.put("month", map.get("month").toString()+"원");
		//연 총 매출액구하기
		list = saleService.selectYear(map);
		for(Object value: list) {
			if(map.get("year") != null) {
				map.put("year", Integer.parseInt(map.get("year").toString())+((SaleDTO)value).getSalesprice());
			}
			else {
				map.put("year", ((SaleDTO)value).getSalesprice());
			}
		}
		map.put("year", map.get("year").toString()+"원");
		//베스트,워스트메뉴 구하기
		list = foodimgService.select(map);
		map.put("bestName1", ((FoodimgDTO)list.get(0)).getName()+" "+((FoodimgDTO)list.get(0)).getCount()+"개");
		map.put("bestName2", ((FoodimgDTO)list.get(1)).getName()+" "+((FoodimgDTO)list.get(1)).getCount()+"개");
		map.put("bestName3", ((FoodimgDTO)list.get(2)).getName()+" "+((FoodimgDTO)list.get(2)).getCount()+"개");
		map.put("worstName1",((FoodimgDTO)list.get(list.size()-1)).getName()+" "+((FoodimgDTO)list.get(list.size()-1)).getCount()+"개");
		map.put("worstName2",((FoodimgDTO)list.get(list.size()-2)).getName()+" "+((FoodimgDTO)list.get(list.size()-2)).getCount()+"개");
		map.put("worstName3",((FoodimgDTO)list.get(list.size()-3)).getName()+" "+((FoodimgDTO)list.get(list.size()-3)).getCount()+"개");
		
		list = saleslistService.select(map);
		
		
		model.addAttribute("saleList", map);
		 
		
		
		
		
		return "shop/sales/sales.tiles";
	}
}
