%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Sheeps may safely graze (first three bars)"
  source = "www.rodeby.net/music"
  composer = "J. S. Bach"
  enteredby = "dk"
  copyright = "This edition copyright 2002 RoDeby Music Digital Engraving. The
  edition may be copied freely so long as no charge is made whatsoever
  including material or production cost. This copyright notice must appear on
  each page. www.rodeby.net/music"
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

%\version "2.4.0"

\include "deutsch.ly"

global =  {
	\key b \major
	\time 4/4
	\bar "|."
}

  
i = \context Staff \relative c'{
	\set Staff.midiInstrument = "acoustic grand" %"fx 3 (crystal)"
	\context Voice = "i"
	\voiceOne
	%\setEasyHeads
  
	\stemUp f8 f16 b, f'8 f16 b,
    f'8 g g b
  | es,8 es16 a, es'8 es16 a, es'8 a a c
  | b8 b32 c32 d16 b16 d c f,
    b8 b32 c32 d16 b16 d c f,
}

ii = \context Staff \relative c'{
	\context Voice = "ii"
	\voiceTwo
	%\setEasyHeads

	\stemUp d8 d d d d8 es es g
  | c, c c c c es c es
  | \stemDown d f d es d f d es
}

iii = \context Staff \relative c{
	\set Staff.midiInstrument = "acoustic grand" %"electric bass (finger)"
	\context Voice = "iii"
	\voiceThree
	%\setEasyHeads
	
	\stemUp b8 b b b b4 b
  | b8 b b b b4 b
    b8 b a a g g f f
}


\score {
	    \context PianoStaff <<
		\context Staff = "treble" << 
		    \global 
		    \clef violin
		    \i
		    
		>>
		\context Staff = "treble" << 
		    \global 
		    \clef violin
		    \ii
		>>
		\context Staff = "bass" <<
		    \global
		    \clef bass
		    \iii
		>>
% TODO Set nicer beaming for all staves - how
		
% For Auftakt
%		#(override-auto-beam-setting '(end 1 8 * *)  1 4)
%		#(override-auto-beam-setting '(end 1 16 * *)  1 4)
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
       % TODO ignored
       tempoWholesPerMinute = #(ly:make-moment 30 2) 
		 }
    % 60 Halbe pro Minute
	    }
}
