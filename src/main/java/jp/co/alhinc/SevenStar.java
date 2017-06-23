package jp.co.alhinc;

import org.springframework.stereotype.Component;

@Component
public class SevenStar implements Tabacco{
	@Override
	public String smoking() {
		return "セブンスターもくもく";
	}
}
