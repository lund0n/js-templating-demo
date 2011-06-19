package com.jeremylund.templating.web;

import com.jeremylund.templating.model.Event;
import com.jeremylund.templating.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
@Controller
@RequestMapping("/events/{eventId}")
public class EventEditController {

	private EventService eventService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView loadEvent(@PathVariable Integer eventId) {
		return new ModelAndView("events/edit", "event", eventService.getEvent(eventId));
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submitEvent(@PathVariable Integer eventId, @ModelAttribute @Valid Event event,
							  BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("event", event);
			return "events/edit";
		} else {
			event.setId(eventId);
			eventService.updateEvent(event);
			return "redirect:/events";
		}
	}

	@Autowired
	public void setEventService(EventService eventService) {
		this.eventService = eventService;
	}
}
