%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Es klappert die Mühle am rauschenden Bach, aus: \"Ein MÃ¤nnlein steht im Walde\""
  source = "VEB Deutscher Verlag fÃ¼r Musik Leipzig, 1970"
  composer = "Horst Irrgang"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
%	\key cis \major
 % \time 3/4 s4*3 \time 2/4 s4*2 \time 3/4 s4*9 \time 2/4 s4*2 \time 3/4 s4*18
\time 3/4
	\bar "|."
}

% "Multiple stanzas": One solution
%i = \context Staff \relative c''{
%	\set Staff.midiInstrument = "celesta" %"fx 3 (crystal)"
%	\context Voice = "i"
%	\voiceOne
%	%\setEasyHeads
%  \time 3/4 s4*3 | \time 2/4 s4*2 | \time 3/4 s4*3 | r4 r a || c8 c g4 g
%  \break \time 2/4 a8 a f4 | \time 3/4 e f8 g a8 f | c'4 r c | d8 d g,4 r8 g
%  \break c8 c f,4 r8 f | b8 b e,4 e | f r r
%}
%\addlyrics {
%    Ihr lie -- ben klei -- nen
%    Voe -- ge -- lein, fliegt al -- le
%    schnell her -- bei! Die Mut -- ter sagt, ihr fin -- det
%    nichts, weils drau --  ssen Win -- ter sei. }
%\addlyrics {
%    Drum hab' ich Koer -- ner
%    euch  ge -- bracht und Sa -- men,
%    Fett und Schrot. Kommt schnell her -- bei, ihr
%    Voe -- ge -- lein, dann habt ihr kei -- ne Not! }

% In Scite auf "File | Encoding | UTF8" umschalten
% Mit win32 Zeichensatztabelle Alt+-Codes ermitteln für
% ü  ö  a  ß
% Eingeben mit Alt + Code
% In Scite auf "File | Encoding | Code Page Property" umschalten
% Ã¼ Ã¶ Ã¤ ÃŸ
% Ergebnis dann wie oben, kopieren in vim

lyricsA = \lyricmode {
    \set stanza = "1."
Es klappert die Muehle am rauschenden Bach: Klipp, klapp.
}
lyricsB = \lyricmode {
    \set stanza = "2."
}
lyricsC = \lyricmode {
    \set stanza = "3."
}
voicei = \relative c'{
  \repeat volta 2 {\partial 4*1 c4 | c f f | f g a | a g g | g2 c4 | \partial
4*2 a r }
  \break \partial 4*1 f8 a | c4 c c | c d c | c b b | b2 b4 | a a a
  \break c b a | a g g | g2 c4 | a r a | g r g | \partial 4*2 f2
}

voiceii = \context Staff \relative c'{
	\set Staff.midiInstrument = "muted trumpet"%"tremolo strings"
	\context Voice = "voiceii"
	\voiceTwo
	%\setEasyHeads

}

voiceiii = \context Staff \relative c' {
	\set Staff.midiInstrument = "electric bass (finger)"
	\context Voice = "voiceiii"
	\voiceThree
	%\setEasyHeads
}

harmony = \chordmode { 
  \repeat volta 2 {\partial 4*1 r4 f,4*6 c,4*6 \partial 4*2 f,4 c, }
  \break \partial 4*1 r4 f,4*6 c,4*6:7 f,4*6
  \break c,4*6:7 f,4*3 c,4*3:7 | \partial 4*2 f,2
}

\score {
		
	\new PianoStaff <<
	  \new ChordNames \with { alignAboveContext = one} {
      \override ChordNames.ChordName #'style = #'jazz
      \set chordChanges = ##t
      \harmony
    }
		\new Staff = "one" << 
		  \new Voice = "singer" {
	      \set Staff.midiInstrument = "celesta" %"fx 3 (crystal)"
        \voiceOne <<
        \global
        \clef violin
  	    \easyHeadsOn
        \voicei >> }
		>>
    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsC
%    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsB
%    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsA
%		\context Staff = "two" << 
%		  \global 
%		  \clef violin
%		  \voiceii
%		>>
%		\context Staff = "three" <<
%		  \global
%		  \clef bass
%		  \voiceiii
%		>>
		%#(override-auto-beam-setting '(end 1 8 * *)  1 4)
		%#(override-auto-beam-setting '(end 1 16 * *)  1 4)
	>>

  \layout {
	  \context {
		  \PianoStaff
			  \accepts Dynamics
%			  \override VerticalAlignment #'forced-distance = #14
		    %%\Score
		    %%\override SpacingSpanner #'spacing-increment = #3
		}	
  }
	\midi {
	  \context {
		  \PianoStaff
		  \accepts Dynamics
    }
		%\tempo 4 = 75
	}
}

