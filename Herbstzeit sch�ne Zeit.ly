%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Herbstzeit, schöne Zeit"
  source = "Volk und Wissen Volkseigener Verlag Berlin"
  composer = "Wort: Peter Franz. Weise: Reinhold Krug"
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
	Herbst -- zeit, schö -- ne Zeit, auf den Herbst sich al -- les freut.
	Al -- le Blät -- ter wer -- den bun -- ter, und die Pflau -- men fal -- len
	run -- ter. Herbst -- zeit, schö -- ne Zeit, bringst uns vie -- le Freud.
}
voicei = \relative c''{
		 a4 fis | e8 e d4 | a'8 a fis fis | e e d4
	\break e8 e a a | fis d e e | e e a a | fis d e e
	\break a4 fis | e8 e d4 | a'8 a fis e | d4 r
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
