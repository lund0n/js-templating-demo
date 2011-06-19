package com.jeremylund.templating.service;

import com.jeremylund.templating.model.Event;
import com.jeremylund.templating.model.EventFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
@Service
public class EventService {

	private EventDao eventDao;

	@Transactional(readOnly = true)
	public List<Event> getEvents(EventFilter eventFilter) {
		return eventDao.getEvents(eventFilter);
	}

	@Transactional(readOnly = true)
	public Event getEvent(Integer eventId) {
		return eventDao.getEvent(eventId);
	}

	@Transactional
	public void updateEvent(Event event) {
		eventDao.updateEvent(event);
	}

	@Autowired
	public void setEventDao(EventDao eventDao) {
		this.eventDao = eventDao;
	}
}
