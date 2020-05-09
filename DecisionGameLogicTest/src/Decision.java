import java.util.ArrayList;

public class Decision 
{
	private ArrayList<Outcome> outcomes;
	private double utility;
	private String text;
	
	public Decision()
	{
		text     = "";
		utility  = 0;
		outcomes = new ArrayList<Outcome>();
	}
	
	public Decision(String text)
	{
		this.text = text;
		utility   = 0;
		outcomes  = new ArrayList<Outcome>();
	}
	
	public Decision(String text, ArrayList<Outcome> outcomes)
	{
		this.text     = text;
		utility       = 0;
		this.outcomes = outcomes;
	}

	/**
	 * @return the outcomes
	 */
	/*public ArrayList<Outcome> getOutcomes() {
		return outcomes;
	}*/
	
	/**
	 * Add an Outcome to the ArrayList of outcomes.
	 * provides access to outcomes.add
	 */
	public void addOutcome(Outcome outcome) {
		outcomes.add(outcome);
	}

	/**
	 * @return the utility
	 */
	public double getUtility() {
		return utility;
	}
	
	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	
	/**
	 * @param outcomes the outcomes to set
	 */
	public void setOutcomes(ArrayList<Outcome> outcomes) {
		this.outcomes = outcomes;
	}

	/**
	 * @param utility the utility to set
	 */
	public void setUtility(double utility) {
		this.utility = utility;
	}

	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	public double ExpectedUtility()
	{
		for(Outcome outcome : outcomes)
		{
			utility += ( outcome.getGoodness() * outcome.getProbability() ) ;
		}
		
		return utility;
	}

}
