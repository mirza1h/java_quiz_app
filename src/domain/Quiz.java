package domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	@ManyToOne
	private Player createdBy;

	@Column(name = "title", unique = true)
	private String title;

	@Column(name = "description", length = 256)
	private String description;
	
	@Column(name = "active")
	private boolean active;
	
	@Column(name = "image_url")
	private String imageUrl;

	
	@Column(name = "questions")
	private List<Question> questions = new ArrayList<>();

	public Quiz() {

	}

	public Quiz(Player createdBy, String title) {
		super();
		this.createdBy = createdBy;
		this.title = title;
	}
	
	

	public Quiz(Player createdBy, String title, String description, boolean active, String imageUrl,
			List<Question> questions) {
		super();
		this.createdBy = createdBy;
		this.title = title;
		this.description = description;
		this.active = active;
		this.imageUrl = imageUrl;
		this.questions = questions;
	}

	public long getId() {
		return id;
	}

	public Player getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Player createdBy) {
		this.createdBy = createdBy;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public void addQuestion(Question question) {
		this.questions.add(question);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public void setId(long id) {
		this.id = id;
	}

}
