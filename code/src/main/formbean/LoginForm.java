package main.formbean;

import org.formbeanfactory.FieldOrder;
import org.formbeanfactory.FormBean;
import org.formbeanfactory.InputType;
import org.formbeanfactory.Label;
@FieldOrder("userName,password")
public class LoginForm extends FormBean {
	private String userName;
    private String password;
    public String getUserName() {
		return userName;
	}
    @Label("Почта")
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	@Label("Пароль")
	@InputType("password")
	public void setPassword(String password) {
		this.password = password;
	}
	public void validate() {
        super.validate();
        if (hasValidationErrors()) {
            return;
        }
        if (userName.matches(".*[<>\"].*")) {
            this.addFieldError("userName", "May not contain angle brackets or quotes");
        }
    }
}