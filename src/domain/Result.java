package domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Result {


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "email")
	private String email;
	

	@Column(name = "quiz_title")
	private String quiz_title;
	

	@Column(name = "createdBy")
	private String createdBy;
	

	@Column(name = "score")
	private int score;

	

	public Result(String firstName, String lastName, String email, String quiz_title, String createdBy, int score) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.quiz_title = quiz_title;
		this.createdBy = createdBy;
		this.score = score;
	}

	

	public Result() {
		super();
	}



	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getQuiz_title() {
		return quiz_title;
	}


	public void setQuiz_title(String quiz_title) {
		this.quiz_title = quiz_title;
	}


	public String getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}
	
	
}
