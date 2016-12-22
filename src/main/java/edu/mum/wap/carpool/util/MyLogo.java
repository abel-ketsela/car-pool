package edu.mum.wap.carpool.util;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class MyLogo extends SimpleTagSupport {
	String foreColor;
	String text;

	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		
			out.write(String.format("<a class='navbar-brand' style='color:%s'>%s</a>", foreColor, text));		
			
	}

	// Setters
	public void setForeColor(String foreColor) {
		this.foreColor = foreColor;
	}

	public void setText(String text) {
		this.text = text;
	}
}