import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;


public class FileTask {

	public static void main(String[] args) {
		String directory = ".";
		String contactName = null;
		String contactNumber = null;
		
		if (args.length <= 0) {
			Scanner scn = new Scanner(System.in);
			
			System.out.print("Directory: ");
			directory = scn.nextLine();
			System.out.print("Contact Name: ");
			contactName = scn.nextLine();
			System.out.print("Contact Number: ");
			contactNumber = scn.nextLine();
			scn.close();
		}else {
			directory = args[0];
			contactName = args[1];
			contactNumber = args[2];
		}
		
		String fullPath = directory + "/" + contactName + ".contact";		
		File file = new File(fullPath);
		int count = 0;
		while(file.exists()) {
			count++;
			fullPath = directory + "/" + contactName + "(" + count + ").contact";
			file = new File(fullPath);
		}
		
		try {
			file.getParentFile().mkdirs();
			file.createNewFile();
			PrintWriter writer = new PrintWriter (file);
			writer.println(contactNumber);
			writer.close();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
}
