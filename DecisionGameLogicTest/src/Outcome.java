import java.io.IOException;

public class Outcome {

	String plainText;
	//String altText
	double goodness;
	double probability;
	
	
	public String getPlainText() {
		return plainText;
	}
	
	public void setPlainText(String plainText) {
		this.plainText = plainText;
	}
	
	public double getGoodness() {
		return goodness;
	}
	
	public void setGoodness(double goodness) throws IOException {
		if (goodness <= 10.0 && goodness >= -10.0) this.goodness = goodness;
		else throw new IOException();
	}
	
	public double getProbability() {
		return probability;
	}
	
	public void setProbability(double probability) throws IOException {
		if (probability <= 1.0 && probability > 0.0) this.probability = probability;
		else throw new IOException();
	}
	
	
}
