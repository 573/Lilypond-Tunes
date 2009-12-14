%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Wolln wir ein Weilchen zusammen gehn"
  source = ""
  composer = "Melodie aus England"
  author = "Magarethe Jehn"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
	\key c \major
  \time 2/4
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
    Und reg -- net's mir zum Dach her -- ein,
    Dach her -- ein, Dach her -- ein, dann wart' ich auf den
    Son -- nen -- schein. He -- jo, he -- jo, he -- jo!
    }
lyricsB = \lyricmode {
    \set stanza = "2."
    Und hab' ich auch im Strumpf ein Loch,
    Strumpf ein Loch, Strumpf ein Loch,
    das macht mir nichts, ich kenn' mich doch,
    he -- jo he -- jo he -- jo!
    }
lyricsC = \lyricmode {
    \set stanza = "3."
    Hab' ich auch auf dem Kopf kein' Hut,
    Kopf kein' Hut, Kopf kein Hut,
    mir geht es trotz -- dem rich -- tig gut,
    he -- jo he -- jo he -- jo!
    }

voicei = \relative c''{
  \partial 8 * 1 g8 | g g g g | a g e r
  \break g f d r | a' g e g | g g g g
  \break a g e c'| h g a h | c4. r8
  }

harmony = \chordmode {
  \partial 8 * 1 r8 |
  c2 |
  c4. r8 |
  g4. r8 |
  a2:m |
  c2 |  
  c2 |
  g2:7 |
  c4. r8 |
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
    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsB
    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsA
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

