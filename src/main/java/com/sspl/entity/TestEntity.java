package com.sspl.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="test")
public class TestEntity {
	
	@Id
	@GenericGenerator(name = "bank_seq_id", strategy = "com.sspl.utility.MyGenerator")
    @GeneratedValue(generator = "bank_seq_id")
	@Column(name = "bank_id", nullable = false, length=25)
	private String personId;

	@Column(name = "bank_name", length = 125, nullable = false)
	private String bank_name;

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	@Override
	public String toString() {
		return "TestEntity [personId=" + personId + ", bank_name=" + bank_name + "]";
	}
	
	

}
