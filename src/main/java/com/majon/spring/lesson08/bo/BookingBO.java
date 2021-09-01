package com.majon.spring.lesson08.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.majon.spring.lesson08.dao.BookingDAO;
import com.majon.spring.lesson08.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking>selectBookingList(){
		
		return bookingDAO.selectBookingList();
		
	}
	
	public int addBooking(String name, Date date, int day, int headcount, String phoneNumber) {
		return bookingDAO.addBooking(name, date, day, headcount, phoneNumber);
	}
	
}
