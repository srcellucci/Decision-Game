import java.util.Scanner;

public class Driver {

	//Test implementation of Decision Game app logic.
	//Developed by Stephen and Sara.
	public static void main(String[] args)
	{
		//Decision decider = new Decision();
		
		// order is text - goodness - probability
		// goodness    -10 - +10
		// probability 0.0 - 1.0
		/*Outcome o1 = new Outcome("Long drive", -3,  1);
		Outcome o2 = new Outcome("Pay raise" ,  8,  1);
		Outcome o3 = new Outcome("Bad boss"  , -6, .4);
		Outcome o4 = new Outcome("Long hours", -4, .8);
		Outcome o5 = new Outcome("Co-Workers",  7, .7);
		
		Decision decision = new Decision("Should I change jobs?");
		
		decision.getOutcomes().add(o1);
		decision.getOutcomes().add(o2);
		decision.getOutcomes().add(o3);
		decision.getOutcomes().add(o4);
		decision.getOutcomes().add(o5);
		
		System.out.println( "Question: " + decision.getText() + " has an expected 'goodness' of " + decision.ExpectedUtility() );
		
		System.out.println(""
		*/
		
		Scanner ip = new Scanner(System.in);
		String input = new String();
		String ocText;// = new String();
		double ocGoodness = 0.0;
		double ocProbability = 0.0;
		
		//Select mode.
		System.out.println("Select mode.\n\n");
		System.out.println("1. Get outcomes for yes and no.");
		System.out.println("2. get outcomes for yes only.");
		int mode = ip.nextInt();
		ip.nextLine();
		
		//Get user's question to decide on.
		System.out.println("Welcome to decision game.\nWhat are you having trouble deciding?");
		input = ip.nextLine();
		Decision deciderYes = new Decision(input);
		
		//Get outcomes for yes case.
		System.out.println("Let's start with what will happen if you decide yes.\nWhat's one possible effect of this?");
		ocText = ip.nextLine();
		System.out.println("how good would it be if that happened?\n-10.0 = a catastrophe, 0.0 = don't care, 10.0 = best thing ever.");
		ocGoodness = ip.nextDouble();
		ip.nextLine();
		System.out.println("On a scale from 0 to 1, how likely is this to happen?");
		ocProbability = ip.nextDouble();
		ip.nextLine();
		deciderYes.addOutcome(new Outcome(ocText, ocGoodness, ocProbability));
		
		System.out.println("Are there any other possible outcomes if you decide yes that you can think of? y/n");
		Boolean done = (ip.nextLine().toLowerCase().charAt(0) == 'n');
		while (! done) {
			System.out.println("What is the possible outcome you'd like to consider?");
			ocText = ip.nextLine();
			System.out.println("how good would it be if that happened?\n-10.0 = a catastrophe, 0.0 = don't care, 10.0 = best thing ever.");
			ocGoodness = ip.nextDouble();
			ip.nextLine();
			System.out.println("On a scale from 0 to 1, how likely is this to happen?");
			ocProbability = ip.nextDouble();
			ip.nextLine();
			deciderYes.addOutcome(new Outcome(ocText, ocGoodness, ocProbability));
			
			System.out.println("Are there any other possible outcomes if you decide yes that you can think of? y/n");
			done = (ip.nextLine().toLowerCase().charAt(0) == 'n');
		}
		
		//Get outcomes for no case, if activated.
		Decision deciderNo = new Decision(); //Define outside block - needed later.
		if (mode == 1) {
			System.out.println("Now let's consider what happens if your answer tot he decision is no.\nWhat's one possible effect of this?");
			ocText = ip.nextLine();
			System.out.println("how good would it be if that happened?\n-10.0 = a catastrophe, 0.0 = don't care, 10.0 = best thing ever.");
			ocGoodness = ip.nextDouble();
			ip.nextLine();
			System.out.println("On a scale from 0 to 1, how likely is this to happen?");
			ocProbability = ip.nextDouble();
			ip.nextLine();
			deciderNo.addOutcome(new Outcome(ocText, ocGoodness, ocProbability));
			
			System.out.println("Are there any other possible outcomes if you decide yes that you can think of? y/n");
			done = (ip.nextLine().toLowerCase().charAt(0) == 'n');
			while (! done) {
				System.out.println("What is the possible outcome you'd like to consider?");
				ocText = ip.nextLine();
				System.out.println("how good would it be if that happened?\n-10.0 = a catastrophe, 0.0 = don't care, 10.0 = best thing ever.");
				ocGoodness = ip.nextDouble();
				ip.nextLine();
				System.out.println("On a scale from 0 to 1, how likely is this to happen?");
				ocProbability = ip.nextDouble();
				ip.nextLine();
				deciderNo.addOutcome(new Outcome(ocText, ocGoodness, ocProbability));
				
				System.out.println("Are there any other possible outcomes if you decide yes that you can think of? y/n");
				done = (ip.nextLine().toLowerCase().charAt(0) == 'n');
			}
		}
		
		//Calculate expected utility/utilities and report.
		switch (mode) {
		case 1: System.out.println("You asked, " + deciderYes.getText());
				System.out.println("Based on the values you input,");
				if (deciderYes.ExpectedUtility() > 0) {
					System.out.println("the best answer for you is probably 'yes'.");
				}
				else if (deciderYes.ExpectedUtility() < 0){
					System.out.println("the best answer for you is probably 'no'.");
				}
				else {
					System.out.println("it's a toss up!");
				}
				break;
		case 2: System.out.println("You asked, " + deciderYes.getText());
				System.out.println("Based on the values you input,");
				if (deciderYes.ExpectedUtility() > deciderNo.ExpectedUtility()) {
					System.out.println("the best answer for you is probably 'yes'.");
				}
				else if (deciderYes.ExpectedUtility() < deciderNo.ExpectedUtility()){
					System.out.println("the best answer for you is probably 'no'.");
				}
				else {
					System.out.println("it's a toss up!");
				}
		}
		
		ip.close();
	}

}
