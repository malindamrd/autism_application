package result;

import com.google.gson.Gson;

public class Test {

	public static void main(String[] args) {
		String q1 = "1";
		String q2 = "1";
		String q3 = "1";
		String q4 = "1";
		String q5 = "1";
		String q6 = "1";
		String q7 = "1";
		String q8 = "1";
		String q9 = "1";
		String q10 = "1";
		String q11 = "1";
		String q12 = "1";
		String q13 = "1";
		String q14 = "1";
		String q15 = "1";
		String q16 = "1";
		String q17 = "1";
		String q18 = "1";
		String q19 = "1";
		String q20= "1";
		String q21= "1";
		
		String input = q1+","+q2+","+q3+","+q4+","+q5+","+q6+","+q7+","+q8+","+q9+","+q10+","+q11+","+q12+","+q13+","+q14+","+q15+","+q16+","+q17+","+q18+","+q19+","+q20+","+q21+",?";
		System.out.println(input);
		Predict pr = new Predict(input);
		try {
			pr.doPrediction();
			Gson json = new Gson();
			String res = json.toJson(pr);
			System.out.println(res);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
