package com.jeremylund.templating.model;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
public enum SortColumnType {
	EVENT_NAME("event_name", "Name"),
	EVENT_DATE("event_date", "Date");

	private String columnName;
	private String description;

	SortColumnType(String columnName, String description) {
		this.columnName = columnName;
		this.description = description;
	}

	public String getColumnName() {
		return columnName;
	}

	public String getDescription() {
		return description;
	}
}
