%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Die Vögel im Winter"
  source = ""
  composer = "Rudolf Nykrin"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
	\key f \major
  \time 3/4 s4*3 \time 2/4 s4*2 \time 3/4 s4*9 \time 2/4 s4*2 \time 3/4 s4*18
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
% Mit win32 Zeichensatztabelle Alt+-Codes ermitteln f�r
% �  �  a  �
% Eingeben mit Alt + Code
% In Scite auf "File | Encoding | Code Page Property" umschalten
% ü ö ä ß
% Ergebnis dann wie oben, kopieren in vim

lyricsA = \lyricmode {
    \set stanza = "1."
    Ihr lie -- ben klei -- nen
    Vö  -- ge -- lein, fliegt al -- le
    schnell her -- bei! Die Mut -- ter sagt, ihr fin -- det
    nichts, weils drau -- ßen Win -- ter sei. }

lyricsB = \lyricmode {
    \set stanza = "2."
    Drum hab' ich Kör -- ner
    euch  ge -- bracht und Sa -- men,
    Fett und Schrot. Kommt schnell her -- bei, ihr
    Vö -- ge -- lein, dann habt ihr kei -- ne Not! }

voicei = \relative c''{
  s4*3 | s4*2 | s4*3 | r4 r a || c8 c g4 g
  \break a8 a f4 | e f8 g a8 f | c'4 r c | d8 d g,4 r8 g
  \break c8 c f,4 r8 f | b8 b e,4 e | f r r
}

voiceii = \context Staff \relative c''{
	\context Voice = "voiceii"
	\voiceTwo
	%\setEasyHeads

  c8 d c4 c | c2 | c8 d c4 c | c2 r4 || c c r 
  \break c c | r2. | c8 d c d c4 | g d' r
  \break a c r | g c8 d c4 | a r r
	%\change Staff = "one"
}

voiceiii = \context Staff \relative c''{
	\set Staff.midiInstrument = "shamisen" %"electric bass (finger)"
	\context Voice = "voiceiii"
	\voiceThree
	%\setEasyHeads

  c4 a g | a2 | c4 a g | f2 r4 || a4 g2
  \break a4 f | g f e | d c r | e2 r4
  \break f2 r4 | d2 c4 | f r r
}

harmony = \chordmode {
  f,2 c4 | f,2 | r2 c,4 | f,2. | r4 c,2 |
  f,2 | c,4 f,2 | c,4 r2 | g,2:m6 r4 |
  f,2:6 r4 | g,2:m6 c,4:7 | f,4 r2
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
    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsB
    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsA
		\context Staff = "two" << 
		  \global 
		  \clef violin
		  \voiceii
		>>
		\context Staff = "three" <<
		  \global
		  \clef violin
		  \voiceiii
		>>
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

