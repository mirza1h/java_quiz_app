package domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Quiz {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private String createdBy;
	
	private List<Question> questions = new ArrayList<>();

	@Column(unique = true)
	private String title;

	private String description;
		
	private String imageUrl;

	public Quiz() {

	}

	public Quiz(String createdBy, String title, String description, String imageUrl,
			List<Question> questions) {
		super();
		this.createdBy = createdBy;
		this.title = title;
		this.description = description;
		this.imageUrl = imageUrl;
		this.questions = questions;
	}

	public long getId() {
		return id;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getTitle() {
		return title;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public String getDescription() {
		return description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

}
