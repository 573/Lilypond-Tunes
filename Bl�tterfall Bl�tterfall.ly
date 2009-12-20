%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Blätterfall, Blätterfall"
  source = "Volk und Wissen Volkseigener Verlag Berlin"
  composer = "Worte: Ursula Groeger. Weise: Fritz Bachmann"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
\key d \major
\time 2/4
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
	Blät -- ter -- fall, Blät -- ter -- fall, gel -- be Blät -- ter ü -- ber -- all
	ra -- scheln, ra -- scheln, es wird kalt, und der Schnee be -- deckt sie bald.
	Blät -- ter -- fall, Blät -- ter -- fall, gel -- be Blät -- ter ü -- ber -- all.
}
voicei = \relative c''{
		 a8 a fis4 | a8 a fis4 | a8 a h h | a a fis4
	\break e8 e g g | fis g a4 | e8 e g g | fis g a4
	\break a8 a fis4 | a8 a fis4 | a8 a g fis | e e d4
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
