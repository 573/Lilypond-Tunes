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
\key g \major
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
	Hei -- lig -- ste Nacht, hei -- lig -- ste Nacht! Fin -- ster -- nis wei -- chet, es
	strah -- let hie -- nie -- den lieb -- lich und präch -- tig vom Him -- mel ein Licht,
	Eng -- el er -- schei -- nen, ver -- kün -- den den Frie -- den, Frie -- den den Men -- schen, wer
	freu -- et sich nicht? Kom -- met, _ ihr Chri -- sten, _ o _ kom -- met _ ge -- schwind!
	Seht da _ die _ Hir -- ten, _ wie ei -- lig _ sie _ sind! Eilt _ mit _ nach _ Da -- vids _ Stadt!
	Den _ Gott _ ver -- _ hei -- ßen _ hat, liegt dort _ als _ Kind, liegt dort _ als _ Kind!
}
voicei = \relative c''{
		 g8 d h' g4 r8                   | g8 d h' g4 r8                  | d'8 h c d h c
	\break d8 c h h a r                    | a fis g a fis a                | g fis e d4 r8
	\break d'8 h c d h c                   | d c h h a r                   | a fis g a fis a
	\break g8 fis e d4 r8                  | g8 g16 d h'8 g g16 d g h | d8 d16 h e8 d4 r8
	\break c8 d16 c h a h8 h16 a g8  | a a16 g a h g4 r8          | d'16 e d c h a g8 h16 g d8
	\break d'16 e d c h a g8 h16 g d8 | a' a16 g a h g4 r8          | a8 a16 g a h g4 r8
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
