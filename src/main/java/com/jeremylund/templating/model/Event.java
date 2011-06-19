package com.jeremylund.templating.model;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;
import org.joda.time.DateMidnight;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
public class Event implements Serializable {

	private Integer id;

	@NotEmpty
	@Size(max = 100)
	private String name;

	@NotNull
	@Size(max = 255)
	private String description;

	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@NotNull
	private DateMidnight eventDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public DateMidnight getEventDate() {
		return eventDate;
	}

	public String getFormattedEventDate() {
		return eventDate.toString("MMM dd, yyyy");
	}

	public void setEventDate(DateMidnight eventDate) {
		this.eventDate = eventDate;
	}

	@Override
	public int hashCode() {
		return HashCodeBuilder.reflectionHashCode(this);
	}

	@Override
	public boolean equals(Object obj) {
		return EqualsBuilder.reflectionEquals(this, obj);
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
