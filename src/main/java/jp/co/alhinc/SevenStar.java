package jp.co.alhinc;

import org.springframework.stereotype.Component;

@Component
public class SevenStar implements Tabako{
	@Override
	public String smoking() {
		return "セブンスターもくもく";
	}
}
