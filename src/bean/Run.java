package bean;

public class Run {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[][][] l =  {{{"A", "B", "C", "D"},{"1","2","3","4"}}, 
				{{"E", "F", "G", "H"},{"5","6","7","8"}}, 
				{{"I", "J", "K", "L"},{"9","10","11","12"}}, 
				{{"M", "N", "O", "P"},{"13","14","15","16"}}};
		
	
		for(int i=0; i< l.length; i++) {
			for(int k=0; k<l[i].length; k++) {
				for(int x=0; x<l[i][k].length; x++) {
					System.out.print(l[i][k][x]);
					
				}
			}
		}
	}

}
