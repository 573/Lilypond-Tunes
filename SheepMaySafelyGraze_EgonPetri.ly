\version "2.12.3-1.mingw"

\header {
  title = "Sheeps may safely graze - Schafe können sicher weiden (from Cantata
  No. 208) - Arranged by Egon Petri"
  source = "Printed Sheet"
  composer = "J. S. Bach"
  enteredby = "dk"
  copyright = "(C) 1985, for all Countries Chester Music Ltd. 8/9 Frith Street, London W1D 3JB"
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
% Assuming voiceThree in Left Hand (context "LinkeHand") and so
goingThreeFromTwo = \change Staff = "LinkeHand" \voiceThree
goingTwoFromThree = \change Staff = "RechteHand" \voiceTwo
  
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
          #'line-break-system-details #'((Y-offset . 35))
          \repeat unfold 2 { s1 * 2 \break }
          \repeat unfold 2 { s1 * 3 \break } \pageBreak
          \repeat unfold 5 { s1 * 3 \break } \pageBreak
          \repeat unfold 5 { s1 * 3 \break } \pageBreak
          s1 * 4 \break
          \repeat unfold 3 { s1 * 3 \break }
          s1 * 4
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
          #'line-break-system-details #'((Y-offset . 35))
          \repeat unfold 2 { s1 * 2 \break }
          \repeat unfold 2 { s1 * 3 \break } \pageBreak
          \repeat unfold 5 { s1 * 3 \break } \pageBreak
          \repeat unfold 5 { s1 * 3 \break } \pageBreak
          s1 * 4 \break
          \repeat unfold 3 { s1 * 3 \break }
          s1 * 4
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

