package jukebox;
/*
 *    Copyright (c) The League of Amazing Programmers 2013-2019
 *    Level 1
 */

import javax.swing.SwingUtilities;

public class JukeboxRunner {
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Jukebox());
		
		Song J = new Song("src/magic_box/Beer.mp3");
		
		J.play();
	}
}
