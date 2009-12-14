%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Kindlein mein"
  source = "VEB Deutscher Verlag für Musik Leipzig, 1970"
  composer = "Horst Irrgang"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.4.0"

\include "deutsch.ly"

global =  {
	\key d \major
	\time 2/4
	%\partial 4* 1
	s2*16 % Diese Zahl (s2 fuer skip bzw. fuer skip 2/4), bezieht sich auf die gesamte Taktanzahl
	\time 3/4
	s2.*4
	%\partial 4* 3
	\bar "|."
}

%~ Einzelstimmen f. polyphonen Gesang, auskomment. 1
%songtext = \lyricmode { Wer hat die schoen -- sten Schaef -- chen? Die hat der gold -- ne Mond, __ der hin -- ter un -- sern Baeu -- men am Him -- mel drue -- ben wohnt.}
  
i = \context Staff \relative c'{
	\set Staff.midiInstrument = "celesta" %"fx 3 (crystal)"
	\context Voice = "i"
	\voiceOne
	%\setEasyHeads
	
	\stemUp fis4 fis8 a | e2 | fis4 fis8 a | e2 | g4 g | fis a | e2 |
	\break d | fis4 fis8 a | e2 | fis4 fis8 a | e2 | g4 g | fis a | e2 |
	\break d4 a'8 h | g4 e a8 a | fis2 a8 h |  g4 e a8 a | fis2.
	
	
	
}

ii = \context Staff \relative c'{
	\context Voice = "ii"
	\voiceTwo
	%\setEasyHeads

	\stemUp a4 h | g h | a h | g h | cis a | d cis | h g |
	\break a fis | a h | g h | a h | g h | cis a | d cis | h ( g |
	\break a ) %~\autochange \voiceOne
	\change Staff = "treble" \stemDown a'8 h | g[ fis] e[ d] [cis cis] | d[ e] fis[ d] [a' h] | g[fis] e[ d] [cis cis] | d2.
}

iii = \context Staff \relative c{
	\set Staff.midiInstrument = "shamisen" %"electric bass (finger)"
	\context Voice = "iii"
	\voiceThree
	%\setEasyHeads
	
	\stemDown d2 | d | d | d | d | d | d |
	\break d | d | d | d | d | d | d | d ( |
	\break d4 ) r | r g fis8 fis | h2 r4 | r g a8 a | d2.
}


\score {
	    \context PianoStaff <<
		%~ Einzelstimmen f. polyphonen Gesang, auskomment. 2
		%\context Lyrics = ii { s1 }
		\context Staff = "treble" << 
		    \global 
		    \clef violin
		    \i
		    
		>>
		\context Staff = "bass" << 
		    \global 
		    \clef bass
		    \ii
		>>
		\context Staff = "bass" <<
		    \global
		    \clef bass
		    \iii
		>>
		%~ Einzelstimmen f. polyphonen Gesang, auskomment. 3
		%\context Lyrics = ii \lyricsto ii \songtext
		
		%~ Eine Stimme mit Begleitung
		\lyricmode {
		 \new Lyrics {
		Kind4 -- lein8 \skip 8 mein,2 schlaf4 nur8 \skip 8 ein,2 weil4 die4 Stern4 -- lein4 kom2 -- men2 und4 der8 \skip 8 Mond2 kommt4 auch8 \skip 8 schon2 wie4 -- der4 an4 -- ge4 -- schwom2 -- men.4 Ei8 -- a,8 Wieg8 -- \skip 8 lein,8 \skip 8 Wieglein8 \skip 8 mein,2 schlaf,8 mein8 Kind4 -- lein,4 schlaf8 nur8 ein!2.
		 }
		}
		
		#(override-auto-beam-setting '(end 1 8 * *)  1 4)
		#(override-auto-beam-setting '(end 1 16 * *)  1 4)
	    >>
	    

	    \layout {

		\context {
			\PianoStaff
			   \accepts Dynamics
			   \override VerticalAlignment #'forced-distance = #14
		    %%\Score
		    %%\override SpacingSpanner #'spacing-increment = #3
		   
		}
		
	    }
	    \midi {
		 \context {
		   \PianoStaff
		   \accepts Dynamics
		 }
		\tempo 4 = 75
	    }
}
