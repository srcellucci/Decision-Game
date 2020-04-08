
public class Outcome 
{
	
	private String text;
	private double goodness;
	private double probability;
	
	public Outcome() 
	{
		
	}
	
	public Outcome(String text, double goodness, double probability)
	{
		this.text        = text;
		this.goodness    = goodness;
		this.probability = probability;
	}

	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * @return the goodness
	 */
	public double getGoodness() {
		return goodness;
	}
	
	/**
	 * @return the probability
	 */
	public double getProbability() {
		return probability;
	}
	
	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * @param goodness the goodness to set
	 */
	public void setGoodness(double goodness) {
		this.goodness = goodness;
	}

	/**
	 * @param probability the probability to set
	 */
	public void setProbability(double probability) {
		this.probability = probability;
	}
	
	public String toString()
	{
		return text + " : " + goodness + " : " + probability;
	}

}
