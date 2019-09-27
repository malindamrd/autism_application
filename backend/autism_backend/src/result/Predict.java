package result;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.trees.RandomTree;
import weka.core.Instances;
import weka.core.converters.ArffSaver; 
import weka.core.converters.ConverterUtils.DataSource;

public class Predict {
	
	int predict;
	
	String input;
	
	String datasetpath ="/autism_backend/src/result/New4_diagnosis+PASS.nominal.arff";
	String modelpath = "/autism_backend/src/result/RandomTree.model";

	public Predict(String input) {
		this.input = input;
	}

	public int getPrediction() {
		return predict;
	}

	public void doPrediction() throws Exception {
		
		/**
		 * Write new line
		 */
		try(PrintWriter output = new PrintWriter(new FileWriter(datasetpath,true)))
		{ 
			output.printf("%s\r\n", input); 
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		DataSource source = new DataSource(
				datasetpath);
		Instances data = source.getDataSet();
		data.setClass(data.attribute("Diagnosis"));

		Classifier cModel = (Classifier) new RandomTree();
		cModel.buildClassifier(data);//building the classifier
		weka.core.SerializationHelper.write(modelpath, cModel);
		Classifier cls = (Classifier) weka.core.SerializationHelper
				.read(modelpath);

		/*
		 * Evaluation eTest = new Evaluation(data); eTest.evaluateModel(cls, data);
		 * 
		 * System.out.println(eTest);
		 */
		double value = cls.classifyInstance(data.lastInstance());
		String prediction = data.classAttribute().value((int) value);
		this.predict = Integer.parseInt(prediction);

		/**
		 * Replace last line ?
		 */
		String line;
		StringBuffer sb = new StringBuffer();

		FileInputStream fis = new FileInputStream(datasetpath);
		BufferedReader reader = new BufferedReader(new InputStreamReader(fis));
		while ((line = reader.readLine()) != null) {
			line = line.replace('?', prediction.charAt(0));
			sb.append(line + "\n");
		}

		BufferedWriter bwr = new BufferedWriter(new FileWriter(new File(datasetpath)));
		// write contents of StringBuffer to a file
		bwr.write(sb.toString());
		// flush the stream
		bwr.flush();
		// close the stream
		bwr.close();

		
		
		
		

	}

}
