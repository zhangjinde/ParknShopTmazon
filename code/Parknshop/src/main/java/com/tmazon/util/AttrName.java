package com.tmazon.util;

public class AttrName {
	private AttrName() {
	}
	
	public class ApplicationScope {
		private ApplicationScope() {
		}
		
		public static final String ONLINE_USERS = "a_online_users";
	}
	
	public class SessionScope {
		private SessionScope() {
		}
		
		public static final String USER = "s_user";
	}
	
	public class RequestScope {
		private RequestScope() {
		}
		
		public static final String ERROR_NAME_PASSWORD = "r_error_name_password";
		public static final String ERROR_PARAMETERS = "r_error_parameters";
		public static final String ERROR_USER_EXISTS = "r_error_user_exists";
		public static final String IS_REGISTER_SUCCESS = "r_is_register_success";
	}
}