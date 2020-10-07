package domain;

import java.io.Serializable;

public class Answer implements Serializable {
	private static final long serialVersionUID = 1L;
	private String text;
	private boolean isCorrect;

	public Answer() {
	}

	public Answer(String text, boolean isCorrect) {
		super();
		this.text = text;
		this.isCorrect = isCorrect;
	}

	public String getText() {
		return text;
	}

}
