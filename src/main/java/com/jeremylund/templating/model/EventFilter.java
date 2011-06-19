package com.jeremylund.templating.model;

import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.joda.time.DateTime;

import java.io.Serializable;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
public class EventFilter implements Serializable {

	private Integer year = new DateTime().getYear();
	private SortColumnType sortColumnType = SortColumnType.EVENT_DATE;
	private OrderType orderType = OrderType.DESC;

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public SortColumnType getSortColumnType() {
		return sortColumnType;
	}

	public void setSortColumnType(SortColumnType sortColumnType) {
		this.sortColumnType = sortColumnType;
	}

	public OrderType getOrderType() {
		return orderType;
	}

	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
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
