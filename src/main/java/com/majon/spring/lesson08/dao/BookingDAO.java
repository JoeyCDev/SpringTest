package com.majon.spring.lesson08.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.majon.spring.lesson08.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
	
	public int addBooking(@Param("name")String name,
			@Param("date")Date date,
			@Param("day")int day,
			@Param("headcount")int headcount,
			@Param("phoneNumber")String phoneNumber
			);
	
	public int deleteBooking(@Param("id")int id);
	
	
	public int countExistingBooking(@Param("name")String name, @Param("phoneNumber")String phoneNumber);
	
	
	public Booking selectExistingBooking(@Param("name")String name, @Param("phoneNumber")String phoneNumber);
	
}
