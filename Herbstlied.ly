%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Heiligste Nacht, aus: \"Wenn es wieder Weihnachten wird\""
  source = "Tigris Verlag GmbH, Köln, ISBN: 3-632-98917-6"
  composer = "Text: Bernhard Verspoell 1810. Melodie: Volksweise aus Österreich"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
\key f \major
\time 4/4
	\bar "|."
}

% In Scite auf "File | Encoding | UTF8" umschalten
% Mit win32 Zeichensatztabelle Alt+-Codes ermitteln für
% �  �  a  �
% Eingeben mit Alt + Code
% In Scite auf "File | Encoding | Code Page Property" umschalten
% ü ö ä ß
% Ergebnis dann wie oben, kopieren in vim

lyricsA = \lyricmode {
	Der Herbst, der Herbst, der Herbst ist da, er bringt uns Wind, hei hus -- sas -- sa.
	Schüt -- telt ab die Blät -- ter, bringt uns Re -- gen -- wet -- ter, hei, hei, hus -- sas -- sa, der Herbst ist da.
}
voicei = \relative c'{
	\partial 8
		 c8 | f4. a8 c4. b8 | a4 g f4. c8 | f4. a8 c4. b8 | a4 g f r
	\break g8 g g b a4 f | g8 g g b a4 f \repeat volta 2 { c' d c8 b a f | a4 g f r8 }
}
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
% vim: set fenc=utf-8 sts=4
