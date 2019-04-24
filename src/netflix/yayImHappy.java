package netflix;

public class yayImHappy {
	public static void main(String[] args) {
		Movie England = new Movie("England is my city", 0);
		Movie EnglandNot = new Movie("Englands not my city", -999999999);
		Movie SentrixAwesome = new Movie("Sentrix is awesome", 999999999);
		Movie GrahamAwesome = new Movie("Graham is awesome", 999999999);
		Movie GrahamIsAwesomerThanArmanAtEverything = new Movie("GrahamIsAwesomerThanArmanAtEverything", 999999999);
		
		NetflixQueue Netflix = new NetflixQueue();
		
		Netflix.addMovie(England);
		Netflix.addMovie(EnglandNot);
		Netflix.addMovie(SentrixAwesome);
		Netflix.addMovie(GrahamAwesome);
		Netflix.addMovie(GrahamIsAwesomerThanArmanAtEverything);
		
		for (int i = 0; i < 5; i++) {
			System.out.println(Netflix.getMovie(i));
		}
		
		Netflix.sortMoviesByRating();
		
		System.out.println(Netflix.getBestMovie());
		System.out.println(Netflix.getMovie(1));
	}
}
