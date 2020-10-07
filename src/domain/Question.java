package domain;

import java.io.Serializable;
import java.util.List;
public class Question implements Serializable {
	private static final long serialVersionUID = 1L;
	private String text;
	private int points;
	private List<Answer> answers;
	private int time;
	
	public Question() {
	}

	public Question(String text, List<Answer> answers, int time, int points) {
		super();
		this.text = text;
		this.answers = answers;
		this.time = time;
		this.points = points;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

}
