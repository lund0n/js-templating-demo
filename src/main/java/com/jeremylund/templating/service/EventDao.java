package com.jeremylund.templating.service;

import com.jeremylund.templating.model.Event;
import com.jeremylund.templating.model.EventFilter;
import org.joda.time.DateMidnight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
@Repository
public class EventDao {

	private final SimpleJdbcTemplate simpleJdbcTemplate;

	@Autowired
	public EventDao(DataSource dataSource) {
		this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSource);
	}

	public List<Event> getEvents(EventFilter eventFilter) {
		return simpleJdbcTemplate.query(
				String.format("SELECT * " +
						"FROM Event " +
						"ORDER BY %s %s",
						eventFilter.getSortColumnType().getColumnName(),
						eventFilter.getOrderType().name()),
				new EventRowMapper());
	}

	public Event getEvent(Integer eventId) {
		return simpleJdbcTemplate.queryForObject(
				"SELECT * FROM Event WHERE event_id = ?",
				new EventRowMapper(),
				eventId);
	}

	public void updateEvent(Event event) {
		simpleJdbcTemplate.update("UPDATE Event " +
				"SET event_name = ?, event_date = ?, event_description = ? " +
				"WHERE event_id = ?",
				event.getName(), event.getEventDate().toDate(), event.getDescription(), event.getId());
	}

	class EventRowMapper implements RowMapper<Event> {

		@Override
		public Event mapRow(ResultSet resultSet, int i) throws SQLException {
			Event event = new Event();
			event.setId(resultSet.getInt("event_id"));
			event.setName(resultSet.getString("event_name"));
			event.setDescription(resultSet.getString("event_description"));
			Date date = resultSet.getDate("event_date");
			if (date != null) {
				event.setEventDate(new DateMidnight(date));
			}
			return event;
		}
	}
}
