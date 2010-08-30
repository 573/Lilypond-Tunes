\version "2.12.3-1.mingw"

Ae =\markup { \char ##x00C4 }
ae =\markup { \char ##x00E4 }
Oe =\markup { \char ##x00D6 }
oe = \markup { \char ##x00F6 }
Ue =\markup { \char ##x00DC }
ue =\markup { \char ##x00FC }
Sz =\markup { \char ##x00DF }

\header {
  title = \markup {\concat{"Sheep may safely graze"}}
  subtitle = "(from J. S. Bach's Birthday Cantata)"
  source = "Printed Sheet"
  composer = "written by J. S. Bach, arranged by Egon Petri"
  enteredby = "dk"
  copyright = "(C) Copyright 1944 in U. S. A. by Boosey & Hawkes, Inc.;
  Copyright Renewed. Copyright for all Countries. All rights reserved."
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\include "deutsch.ly"

global =  {
	\key b \major
	\time 4/4
	\bar "|."
}

sD = \stemDown
sU = \stemUp
% Assuming voiceThree in Left Hand (context "LinkeHand")
goingThreeFromTwo = \change Staff = "LinkeHand" \voiceThree
goingTwoFromThree = \change Staff = "RechteHand" \voiceTwo

goingOneFromTwo = \voiceOne
goingTwoFromOne = \voiceTwo

RHStimmeEinsNoten = \relative g'' {
%  \voiceOne
%<es g b>2 r
}

RHStimmeZweiNoten = \relative c'{
%  \voiceTwo
%<a c es>2 r
}

LHStimmeEinsNoten = \relative g' {
%  \voiceThree
%<es g b>2 r
}

LHStimmeZweiNoten = \relative c {
%  \voiceFour
%<a c es>2 r
}


\score {
  <<  % Beide Piano-Systeme müssen gleichzeitig sein
    \new PianoStaff <<
      \new Staff = "RechteHand" <<
        \global  % Taktangabe und Tonart setzen
        \override NonMusicalPaperColumn #'line-break-permission = ##f
        \override NonMusicalPaperColumn #'page-break-permission = ##f
        \set Staff.midiInstrument = "acoustic grand"
        \clef "treble"
        \new Voice {
          \overrideProperty "Score.NonMusicalPaperColumn"
          #'line-break-system-details #'((Y-offset . 15))
          \repeat unfold 2 { s1 * 2 \break }
          \repeat unfold 2 { s1 * 3 \break }\pageBreak
          \repeat unfold 5 { s1 * 3 \break }\pageBreak
          \repeat unfold 5 { s1 * 3 \break }\pageBreak
          s1 * 4 \break
          \repeat unfold 5 { s1 * 3 \break }
          s1 * 4 \break
        }
        \new Voice { \voiceOne \RHStimmeEinsNoten }
        \new Voice { \voiceTwo \RHStimmeZweiNoten }
      >>  % RH Staff-Kontext beenden
      \new Staff = "LinkeHand" <<
        \global
        \override NonMusicalPaperColumn #'line-break-permission = ##f
        \override NonMusicalPaperColumn #'page-break-permission = ##f
        \set Staff.midiInstrument = "acoustic grand"
        \clef "bass"
        \new Voice {
          \overrideProperty "Score.NonMusicalPaperColumn"
          #'line-break-system-details #'((Y-offset . 15))
          \repeat unfold 2 { s1 * 2 \break }
          \repeat unfold 2 { s1 * 3 \break }\pageBreak
          \repeat unfold 5 { s1 * 3 \break }\pageBreak
          \repeat unfold 5 { s1 * 3 \break }\pageBreak
          s1 * 4 \break
          \repeat unfold 5 { s1 * 3 \break }
          s1 * 4 \break
        }
        \new Voice { \voiceThree \LHStimmeEinsNoten }
        \new Voice { \voiceFour  \LHStimmeZweiNoten }
      >>  % LH Staff-Kontext beenden
    >>  % Klaviersystem beenden
  >>
  \midi {
    \context {
      tempoWholesPerMinute = #(ly:make-moment 12 4)
    }
  }
  % layout important to have both printed score and midi
  \layout {
  indent = 1.0\cm
  }
}  % Partitur-Kontext beenden

