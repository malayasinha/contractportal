package com.sspl.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
				.usersByUsernameQuery(
						"SELECT username, password, enabled FROM users WHERE enabled='1' AND username = ?")
				.authoritiesByUsernameQuery(
						"SELECT users.username,role.role_name FROM role,users WHERE role.role_id=users.role_id AND users.enabled='1' AND role.enabled='Y' AND users.username=?");
				
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests().antMatchers("/admin/**").access("hasRole('ADMIN','USER')");
		http
		.formLogin()
		.loginPage("/login")
		.loginProcessingUrl("/loginprocessing")
		.defaultSuccessUrl("/welcome")
		.usernameParameter("username")
		.passwordParameter("password")
		.failureUrl("/fail2login")
		.and()
		.logout()
		.logoutSuccessUrl("/logoutSuccess")
		.invalidateHttpSession(true)
		.and()
		.exceptionHandling().accessDeniedPage("/403")
		.and()
		.csrf().disable();
		
	      http.authorizeRequests()
	      .antMatchers("/fail2login/**").permitAll() 
	      //.antMatchers("/welcome/**").permitAll()
	      .antMatchers("/test/**").permitAll()
	      .antMatchers("/login**").permitAll();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("password-->"+encoder.encode("admin"));
		return encoder;
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}
