package cow_timer;
/*
 *    Copyright (c) The League of Amazing Programmers 2013-2019
 *    Level 1
 */

import java.applet.AudioClip;
import java.io.IOException;
import javax.swing.JApplet;

public class CowTimer {

	/* 1. Make a constructor for the CowTimer class that initializes the minutes variable */
	
	/* 4. Complete the main method of the CowTimerRunner class */

	private int minutes;

	public void setTime(int minutes) {
		this.minutes = minutes;
		System.out.println("Cow time set to " + minutes + "0 seconds.");
	}

	public void start() throws InterruptedException {
		speak("ooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsi ooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsiooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsiooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsiooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsiooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsiooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsiooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsiooomooofooooodoooooqooooo pooosdooo soommoo doo meowho isdu odjhsi");
		/*
		 * 2. Count down the minutes, print the current minute then sleep for the number of minutes
		 * using Thread.sleep(int milliseconds). 
		 */

		Thread.sleep(Integer.parseInt(minutes + "0000"));
		/*
		 * 3. When the timer is finished, use the playSound method to play a moo sound.
		 * You can use the .wav file in the default package, or you can download one
		 * from freesound.org, then drag it intothe default package.
		 */
		System.out.println("Done");
		//playSound("src/cow_timer/moo.wav");
		speak("ooomooofooooodoooooqooooo");
	}

	private void playSound(String fileName) {
		AudioClip sound = JApplet.newAudioClip(getClass().getResource(fileName));
		sound.play();
	}

	private void speak(String stuffToSay) {
		try {
			Runtime.getRuntime().exec("say " + stuffToSay).waitFor();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
