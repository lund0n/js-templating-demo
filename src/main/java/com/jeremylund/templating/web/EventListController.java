package com.jeremylund.templating.web;

import com.jeremylund.templating.model.Event;
import com.jeremylund.templating.model.EventFilter;
import com.jeremylund.templating.model.OrderType;
import com.jeremylund.templating.model.SortColumnType;
import com.jeremylund.templating.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
@Controller
@RequestMapping("/events")
@SessionAttributes(value = "eventFilterForm")
public class EventListController {

	private EventService eventService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listEvents(@ModelAttribute EventFilter eventFilterForm) {
		return filterEvents(eventFilterForm == null ? new EventFilter() : eventFilterForm);
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView filterEvents(@ModelAttribute EventFilter eventFilterForm) {
		ModelAndView modelAndView = new ModelAndView("events/list");
		final List<Event> events = eventService.getEvents(eventFilterForm);
		return modelAndView
				.addObject("eventFilterForm", eventFilterForm)
				.addObject("events", filterEventsByYear(eventFilterForm.getYear(), events))
				.addObject("years", getYearListFrom(events));
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView eventsList(@ModelAttribute EventFilter eventFilterForm) {
		return new ModelAndView("eventsTmpl/events", "eventFilterForm", eventFilterForm);
	}

	@RequestMapping(method = RequestMethod.GET, headers = "accept=application/json")
	public @ResponseBody List<Event> getEvents(@ModelAttribute EventFilter eventFilterForm) {
		return filterEventsByYear(eventFilterForm.getYear(), eventService.getEvents(eventFilterForm));
	}

	private List<Event> filterEventsByYear(Integer year, List<Event> events) {
		List<Event> filteredEvents = new ArrayList<Event>();
		for (Event event : events) {
			if (event.getEventDate().getYear() == year) {
				filteredEvents.add(event);
			}
		}
		return filteredEvents;
	}

	private Set<Integer> getYearListFrom(List<Event> events) {
		Set<Integer> years = new TreeSet<Integer>();
		for (Event event : events) {
			years.add(event.getEventDate().getYear());
		}
		return years;
	}

	@ModelAttribute("sortColumnValues")
	public List<SortColumnType> getSortColumnValues() {
		return Arrays.asList(SortColumnType.values());
	}

	@ModelAttribute("orderValues")
	public List<OrderType> getOrderValues() {
		return Arrays.asList(OrderType.values());
	}

	@Autowired
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
}
