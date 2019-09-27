package result;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

@Path("/getResult")
public class Result {

	@GET
	@Produces(MediaType.TEXT_HTML)
	public String sayHello() {
		String res = "<h1> Hi Im Malinda</h2>";
		return res;
	}
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String sayHelloJSON(@QueryParam("name") String name,
			 @QueryParam("q1") String q1,
			 @QueryParam("q2") String q2,
			 @QueryParam("q3") String q3,
			 @QueryParam("q4") String q4,
			 @QueryParam("q5") String q5,
			 @QueryParam("q6") String q6,
			 @QueryParam("q7") String q7,
			 @QueryParam("q8") String q8,
			 @QueryParam("q9") String q9,
			 @QueryParam("q10") String q10,
			 @QueryParam("q11") String q11,
			 @QueryParam("q12") String q12,
			 @QueryParam("q13") String q13,
			 @QueryParam("q14") String q14,
			 @QueryParam("q15") String q15,
			 @QueryParam("q16") String q16,
			 @QueryParam("q17") String q17,
			 @QueryParam("q18") String q18,
			 @QueryParam("q19") String q19,
			 @QueryParam("q20") String q20,
			 @QueryParam("q21") String q21
			 
			) throws Exception 
	{
		
		String input = q1+","+q2+","+q3+","+q4+","+q5+","+q6+","+q7+","+q8+","+q9+","+q10+","+q11+","+q12+","+q13+","+q14+","+q15+","+q16+","+q17+","+q18+","+q19+","+q20+","+q21+",?";
		
		Predict pr = new Predict(input);
		pr.doPrediction();
		
		Gson json = new Gson();
		String res = json.toJson(pr);
		return res;
	}
	
}
