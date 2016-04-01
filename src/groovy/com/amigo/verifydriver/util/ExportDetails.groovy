package com.amigo.verifydriver.util

import java.util.List;
import java.util.Map;

class ExportDetails{
	Map formatters
	Map parameters
	List fields
	Map labels
	public ExportDetails(List fields, Map labels, Map formatters, Map parameters) {
		super();
		this.formatters = formatters;
		this.parameters = parameters;
		this.fields = fields;
		this.labels = labels;
	}	
}
