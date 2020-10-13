package com.sspl.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery(
						"SELECT username, password, enabled FROM users WHERE enabled='1' AND username = ?")
				.authoritiesByUsernameQuery(
						"SELECT users.username,role.role_name FROM role,users WHERE role.role_id=users.role_id AND users.enabled='1' AND role.enabled='Y' AND users.username=?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/").permitAll();
		
		//http.authorizeRequests().antMatchers("/admin/**").access("hasRole('ADMIN','USER')").and()
		http.formLogin().loginPage("/login").failureUrl("/fail2login").defaultSuccessUrl("/welcome").usernameParameter("username").passwordParameter("password").and()
		.logout().logoutSuccessUrl("/logoutSuccess").invalidateHttpSession(true).and()
		.exceptionHandling().accessDeniedPage("/403").and()
		.csrf().disable();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}
