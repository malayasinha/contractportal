package com.sspl.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity  
@Table(name="role")  
public class Role  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

      
    @Id  
    @GeneratedValue  
    @Column(name="role_id")
    private Integer id;  
      
    @Column(name="role_name")
    private String role;  
      
    @Column(name="enabled")
    private String enabled;  
    
    public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	//private Set<User> userRoles;  
    public Integer getId() {  
        return id;  
    }  
  
    public void setId(Integer id) {  
        this.id = id;  
    }  
  
    public String getRole() {  
        return role;  
    }  
  
    public void setRole(String role) {  
        this.role = role;  
    }

	@Override
	public String toString() {
		return "Role [id=" + id + ", role=" + role + ", enabled=" + enabled + "]";
	}  
  
  /*  public Set<User> getUserRoles() {  
        return userRoles;  
    }  
  
    public void setUserRoles(Set<User> userRoles) {  
        this.userRoles = userRoles;  
    } */
    
      
}  
