%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Kommet, ihr Hirten, aus: \"Wenn es wieder Weihnachten wird\""
  source = "Tigris Verlag GmbH, Köln, ISBN: 3-632-98917-6"
  composer = "Volksweise aus Böhmen. Text: Karl Riedel"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
\key f \major
\time 3/4
	\bar "|."
}

% In Scite auf "File | Encoding | UTF8" umschalten
% Mit win32 Zeichensatztabelle Alt+-Codes ermitteln f�r
% �  �  a  �
% Eingeben mit Alt + Code
% In Scite auf "File | Encoding | Code Page Property" umschalten
% ü ö ä ß
% Ergebnis dann wie oben, kopieren in vim

lyricsA = \lyricmode {
    Kom -- met _  ihr _ Hir -- ten _ ihr _ Män -- ner _ und _
    Frau'n.
}
lyricsB = \lyricmode {
    kom -- met _ das _ lieb -- li _ -- che _ Kind -- lein _ zu _
    schau'n.
}
lyricsC = \lyricmode {
    \set stanza = ""
    _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
    Chris -- tus, der Herr, ist heu -- te ge -- bo -- ren,
   den Gott zum Hei -- land euch hat er -- ko -- ren: Fürch -- tet _ euch _ nicht!
}
voicei = \relative c''{
	\repeat volta 2 {	c4 c8 a d b | c4 c8 a d b | c4 a8 c g a | f2 r4 }
	f4 a8 f a c | f,4 a8 f g c, | f4 a8 f a c, | f4 a8 f g c, | c'4 a8 c g a | f2 r4
}
%harmony = \chordmode {
%  s4*3*10
%}
\score {		
	\new PianoStaff <<
%		\new ChordNames \with { alignAboveContext = one} {
%			\override ChordNames.ChordName #'style = #'jazz
%			\set chordChanges = ##t
%			\harmony
%		}
		\new Staff = "one" <<
			\new Voice = "singer" {
				\set Staff.midiInstrument = "celesta" %"fx 3 (crystal)"
				\voiceOne <<
					\global
					\clef violin
					\voicei
				>>
			}
		>>
		\new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsC
		\new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsB
		\new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsA
	>>

	\layout {
		\context {
			\PianoStaff
			\accepts Dynamics
		}
	}
	\midi {
		\context {
			\PianoStaff
			\accepts Dynamics
		}
		\tempo 8 = 96
	}
	
}
\markup {
	\column{
		\line{ Die Hirten: }
		\line{ Lasset uns sehen in Bethlehems Stall, }
		\line{ was uns verheißen der himmlische Schall. }
		\line{ Was wir dort finden, lasset uns künden, }
		\line{ lasset uns preisen in frommen Weisen: Halleluja. }
	}
}
\markup{
	\wordwrap-string #"
		Alle:
		
		Wahrlich, die Engel verkündigen heut'
		
		Bethlehems Hirtenvolk gar große Freud'.
		
		Nun soll es werden Friede auf Erden,
		
		den Menschen allen ein Wohlgefallen: Ehre sei Gott!"
}

% vim: set fenc=utf-8
