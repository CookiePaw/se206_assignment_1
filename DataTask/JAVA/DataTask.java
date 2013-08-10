import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class DataTask {

	public static void main(String[] args) {

		String path = ".";
		String outName = "out.txt";
		
		List<String> value = new ArrayList<String>();
		
		// Directory path here
		String fileName;
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();


		Scanner scn;
		String content = null;
		for (File f : listOfFiles) {

			if (f.isFile()) {
				fileName = f.getName();
				if (fileName.contains("contact") || fileName.contains("CONTACT")) {
					try {
						scn = new Scanner(new File(fileName));
						content = scn.nextLine();
						if (!value.contains(content)){
							value.add(content);
						}
						scn.close();
					} catch (FileNotFoundException e) {
						System.out.println("File " + fileName + " does not exist");
					}
					
				}
			}
		}
		Collections.sort(value);
		
		File outFile = new File(outName);
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(outFile));
			for (String s : value) {
				writer.write(s + "\n");
			}
			writer.close();
		} catch (FileNotFoundException e) {
			System.out.println("File " + outFile + " does not exist");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}	
	}
}
