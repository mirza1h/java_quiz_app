package domain;

import java.io.Serializable;
import java.util.List;
public class Question implements Serializable {

	private static final long serialVersionUID = 1710781582828487091L;
	private String text;
	private List<Answer> answers;
	private int time;
	private int points;
	
	public Question() {
	}


	public Question(String text, List<Answer> answers, int time, int points) {
		super();
		this.text = text;
		this.answers = answers;
		this.time = time;
		this.points = points;
	}




	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}
	
	

}
