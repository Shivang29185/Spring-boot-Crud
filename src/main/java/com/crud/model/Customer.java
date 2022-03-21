package com.crud.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Entity
@Table(name = "customerdetails")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@NotNull
	@Size(min = 3, max = 15)
	@Column(name = "firstname")
	private String firstName;

	@NotNull
	@Size(min = 3, max = 15)
	@Column(name = "lastname")
	private String lastName;

	@NotNull
	@Column(name = "dateofbirth")
	private String dateOfBirth;

	@NotNull
	@Size(min = 10, max = 17)
	private String mobile;

	@NotNull
	@Size(min = 10, max = 40)
	private String address1;

	@Size(min = 10, max = 40)
	private String address2;

	@NotNull
	private int age;

	@NotNull
	private int gender;

	@NotNull
	@Size(max = 40)
	private String email;

}