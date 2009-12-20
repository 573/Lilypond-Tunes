%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Stille Nacht, heilige Nacht, aus: \"Wenn es wieder Weihnachten wird\""
  source = "Tigris Verlag GmbH, Köln, ISBN: 3-632-98917-6"
  composer = "Text: Joseph Mohr. Melodie: Franz Gruber"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
\time 6/8
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
	Stil -- _ le Nacht, hei -- li -- ge Nacht! Al -- les schläft,
	ein -- sam wacht nur das trau -- te hoch -- hei -- li -- ge Paar.
	Hol -- der Kna -- be im lok -- ki -- gen Haar, schlaf' in himm -- li -- scher
	Ruh', __ schlaf __ _ in himm -- li -- scher Ruh'! __
}
voicei = \relative c''{
	g8. a16 g8 e4. | g8. a16 g8 e4. | d'4 d8 h4.
	\break c4 c8 g4. | a4 a8 c8. h16 a8 | g8. a16 g8 e4.
	\break a4 a8 c8. h16 a8 | g8. a16 g8 e4. | d'4 d8 f8. d16 h8
	\break c4.( e4.) | c8 g e g8. f16 d8 | c4.( c) r8
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
