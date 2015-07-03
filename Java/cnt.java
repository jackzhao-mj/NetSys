import java.io.*;
import java.util.*;

public class cnt{
	

	public static void main(String[] args) {
		Map<String, Integer> addrMap = new HashMap<String, Integer>();

		try {
			File file = new File("sample.out");
			FileReader fileReader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedReader(fileReader);
			StringBuffer stringBuffer = new StringBuffer();
			String lines = new String();
			lines = "0x7fd54a74e2d3: W 0x7fff7b4b1f18";
			while ((lines = bufferedReader.readLine()) != null) {

				if (lines.equals("#eof"))
				break;

			if (lines.contains(": R ")) {
				String[] addrs = lines.split(": R ");
				String ip = addrs[0]; 
				String mem = addrs[1];

				if (addrMap.containsKey(mem)) {
					Integer cnt = addrMap.get(mem);
					addrMap.put(mem, cnt + 1);
				}
				else
					addrMap.put(mem, 1);
			}

			if (lines.contains(": W ")) {
				String[] addrs = lines.split(": W ");
				String ip = addrs[0]; 
				String mem = addrs[1];

				if (addrMap.containsKey(mem)) {
					Integer cnt = addrMap.get(mem);
					addrMap.put(mem, cnt + 1);
				}
				else
					addrMap.put(mem, 1);
			}
		}
			fileReader.close();
		}
		
		catch (IOException e) {
			e.printStackTrace();
		}
		// System.out.println(addrMap);
		Iterator it = addrMap.entrySet().iterator();
		while(it.hasNext()) {
			Map.Entry<String, Integer> entry = (Map.Entry<String, Integer>)it.next();
			try {
		      PrintWriter out = new PrintWriter(new FileWriter("result.txt"));
		      out.println(entry);
		      out.close();
		   }
		      catch(IOException e1) {
		        System.out.println("Error during reading/writing");
		   }
		   
		}
	}

}