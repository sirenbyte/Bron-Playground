package main.formbean;

import java.util.Date;

import org.formbeanfactory.FieldOrder;
import org.formbeanfactory.FormBean;
import org.formbeanfactory.InputType;

public class CommentForm extends FormBean {
	private String comment;
	private String stars;
	
	public String getStars() {
		return stars;
	}
	@InputType("hidden")
	public void setStars(String stars) {
		this.stars = stars;
	}

	public String getComment() {
		return comment;
	}
	
	@InputType("text")
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public Date getDate() {
    	Date date = new Date();
    	return date;
    }
	public void validate() {
        super.validate();

        if (hasValidationErrors()) {
            return;
        }

    }
	
	
}
