%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Frau Holle, aus: \"Ein Männlein steht im Walde\""
  source = "VEB Deutscher Verlag für Musik Leipzig, 1970"
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
% Mit win32 Zeichensatztabelle Alt+-Codes ermitteln f�r
% �  �  a  �
% Eingeben mit Alt + Code
% In Scite auf "File | Encoding | Code Page Property" umschalten
% ü ö ä ß
% Ergebnis dann wie oben, kopieren in vim

lyricsA = \lyricmode {
    \set stanza = "1."
Frau Hol -- le, Frau Hol -- le, die schüt -- telt ih -- re Bet -- ten aus,
fällt blü -- ten -- wei -- ßer Schnee her -- aus, so vie -- le Flöck -- chen
oh -- ne Zahl, so vie -- le Flöck -- chen auf ein -- mal.
Frau Hi -- Ha -- Hol -- le du, schütt -- le flei -- ßig zu!
}
lyricsB = \lyricmode {
    \set stanza = "2."
Frau Hol -- le, Frau Hol -- le, die guckt zu ih -- rem Haus he -- raus.
Wie sieht die Welt so präch -- tig aus! Da kommt ein ar -- mes Mäg -- de -- lein,
das ru -- fet sie zu sich he -- rein. Frau Hi -- Ha -- Hol -- le du,
schüt -- tle flei -- ßig zu!
}
lyricsC = \lyricmode {
    \set stanza = "3."
Frau Hol -- le, Frau Hol -- le, die schüt -- telt mit dem Mäg -- de -- lein
viel blit -- ze -- wei -- ße  Flöck -- chen fein. Da freu -- en sich
die Kin -- der sehr, die bei -- den schüt -- teln im -- mer mehr.
Frau Hi -- Ha -- Hol -- le du, schüt -- tle flei -- ßig zu!
}
voicei = \relative c'{
  \partial 8 d16 ( e ) | fis4 fis8[ d16 ( e )] | fis4 fis8 a | g fis e d |
  e[ e16 ( fis )] e8[ a] |
  \break g8 fis e d | e[ e16 ( fis )] e8[ fis] | d8 d e g | fis8. g16 a8 fis
  \break d8 d e g | fis8. g16 a8 a | d4 h | a8[ a16 ( h )] a4 | g8. g16 e8 a |
d,4 r
}

voiceii = \context Staff \relative c'{
	\set Staff.midiInstrument = "muted trumpet"%"tremolo strings"
	\context Voice = "voiceii"
	\voiceTwo
	%\setEasyHeads

  \partial 8 r8 | cis4 d8 r | cis4 d ( | d ) h | cis2
  \break d4 h | cis4. cis8 | h4 cis | d8. e16 fis8 d
  \break h4 cis | d8. e16 fis4 | fis2 | e2 | d4 cis | d4 r
	%\change Staff = "one"
}

voiceiii = \context Staff \relative c' {
	\set Staff.midiInstrument = "electric bass (finger)"
	\context Voice = "voiceiii"
	\voiceThree
	%\setEasyHeads

  \partial 8 r8 | a fis h4 | a8 fis h h, | e fis g e | a4 e (
  \break e8 ) fis g e | a4. fis8 | h4 a | d cis
  \break h4 a | d ( cis16 ) fis, g a | h4 g | fis8 fis16 ( g ) fis4 | e4 a |
d, r
}

harmony = \chordmode {
  s8*5
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
		\context Staff = "two" << 
		  \global 
		  \clef violin
		  \voiceii
		>>
		\context Staff = "three" <<
		  \global
		  \clef bass
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

