package com.jeremylund.templating.model;

/**
 * @author Jeremy
 * @version Feb 15, 2011
 */
public enum OrderType {
	ASC("Ascending"),
	DESC("Descending");
	
	private String description;

	OrderType(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
}
