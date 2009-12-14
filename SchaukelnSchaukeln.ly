%\paper {
%  #(define dump-extents #t)
  
%  indent = 0\mm
%  linewidth = 160\mm - 2.0 * 0.4\in
%  raggedright = ##t
%}
\header {
  title = "Schaukeln, schaukeln"
  source = "Spielidee: Indisch"
  composer = "Wolfgang Jehn"
  author = "Magarete Jehn"
  enteredby = "dk"
  copyright = "Applies unmodified."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\version "2.12"

%\include "deutsch.ly"

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
    \set stanza = "1."
    Al -- le Vö -- gel hok -- ken hier und
    schau -- keln, schau -- keln- und dem al -- ten
    Baum, dem macht das Schau -- keln rich -- tig Spaß.
    }
lyricsB = \lyricmode {
    \set stanza = "2."
    Al -- le Vö -- gel duk -- ken sich im
    Re -- gen, Re -- gen- und der Baum der schüt -- telt sich
    und lacht sich ei -- nen Ast!
    }
lyricsC = \lyricmode {
    \set stanza = "3."
    Al -- le Vö -- gel hok -- ken da in Wind
    und Was -- ser- schau -- keln hin und schau -- keln her,
    und kei -- ner schert sich drum.
    }
lyricsD = \lyricmode {
    \set stanza = "4."
    Al -- le Vö -- gel wer -- den im -- mer käl -- ter,
    nas -- ser- hab'n ge -- nug vom Schau -- keln jetzt und fal -- len
    ein -- fach um!
    }


harmony = \chordmode {
  f,2.:7+ |
  d,2.:m7 |
  f,2.:7+ |
  d,2.:m7 |
  f,2.:7+ |  
  g,2.:m7 |
  c,2.:7
  f2
  r4
}

voicei = \relative c'{
  f8 f f4 f | f8 f f4 a
  \break c2 a4 | c2 a4 | f8 f f4 f
  \break f8 f f4 a | c8 c b4 g | f2 r4
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
    \new Lyrics \with { alignBelowContext = one } \lyricsto singer \lyricsD
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

