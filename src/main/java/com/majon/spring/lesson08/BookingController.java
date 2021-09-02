package com.majon.spring.lesson08;

import static org.assertj.core.api.Assertions.from;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.majon.spring.lesson08.bo.BookingBO;
import com.majon.spring.lesson08.model.Booking;

@Controller
@RequestMapping("/lesson08")
public class BookingController {

	@Autowired
	private BookingBO bookingBO;
	
	@GetMapping("/view_booking_main")
	public String viewBookingMain() {
		
		return "/lesson08/BookingMain";
		
	}
	
	@GetMapping("/view_booking_list")
	public String viewBookingList(Model model) {
		
		List<Booking>bookingList = bookingBO.selectBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "/lesson08/ViewBookingList";
		
	}
	
	@GetMapping("/view_booking_page")
	public String viewBookingPage() {
			
		return "/lesson08/ViewBookingPage";
	}
	
	@PostMapping("/validation_check")
	@ResponseBody
	public Map<String,String> validationCheck(
			@RequestParam("name")String name,
			@RequestParam("date")Date date,
			@RequestParam("day")int day,
			@RequestParam("headcount")int headcount,
			@RequestParam("phoneNumber")String phoneNumber
			){
		
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map<String,String> result = new HashMap<>();
		
		if(count==1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
				
	}
	
	@GetMapping("/delete_booking")
	@ResponseBody
	public Map<String,String>deleteBooking(@RequestParam("id")int id){
		
		int count = bookingBO.deleteBooking(id);
		
		Map<String,String>result = new HashMap<>();
		if(count == 1) {
			result.put("result","success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	@PostMapping("/lookup")
	@ResponseBody
	public Map<String,Object>lookupBooking(
			@RequestParam("name") String name
			,@RequestParam("phoneNumber") String phoneNumber){
		
		boolean bool = bookingBO.doesExists(name, phoneNumber);
		
		Map<String,Object>result = new HashMap<>();
		
		Booking booking = new Booking();
		
		booking = bookingBO.getExistingBooking(name, phoneNumber);
		
		Date dateObject = booking.getDate();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String dateToString = formatter.format(dateObject);



		
		if(bool) {
			result.put("name", booking.getName());
			result.put("date", dateToString);
			result.put("day", booking.getDay());
			result.put("headcount", booking.getHeadcount());
			result.put("state", booking.getState());
		}else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
	
	
}
