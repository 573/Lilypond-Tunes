%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Am Weihnachtsbaum die Lichter brennen, aus: \"Wenn es wieder Weihnachten wird\""
  source = "Tigris Verlag GmbH, Köln, ISBN: 3-632-98917-6"
  composer = "Volksweise. Text: Hermann Kletke"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

\include "deutsch.ly"

global =  {
\time 3/4
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
	Am Weih -- nachts -- baum die Lich -- ter bren -- nen, wie glänzt er fest -- lich, lieb und mild, als spräch' er: "Wollt in mir er -- ken -- nen ge -- treu -- er Hoff -- nung stil -- les Bild!"
}
voicei = \relative c'{
	\partial 8*3
		c8 c e | g4( e8) g8 c a | g4 e8 g a g
	\break 	f4 d g8 g | e4 r8 e e g | f4( d8) f f a
	\break 	g4 e8 e e g | f4 d g8 g | e4 r8
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
\markup{
	\wordwrap-string #"
		Die Kinder stehn  mit hellen Blicken,
		
		das Auge lacht, es lacht das Herz,
		
		o fröhlich seliges Entzücken,
		
		die Alten schauen himmelwärts."
}

\markup{
	\wordwrap-string #"
		Zwei Engel sind hereingetreten,
		
		kein Auge hat sie kommen sehn;
		
		sie gehn zum Weihnachtstisch und beten
		
		und wenden wieder sich und gehn."
}
\markup{
	\wordwrap-string #"
		Kein Ohr hat ihren Spruch vernommen,
		
		unsichtbar jedes Menschen Blick
		
		sind sie gegangen wie gekommen,
		
		doch Gottes Segen blieb zurück!"
}
% vim: set fenc=utf-8 sts=4
