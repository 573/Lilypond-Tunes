\version "2.12.0"

\header {
  title = "Ave Maria"
  source = "Printed Sheet"
  composer = "J. S. Bach"
  enteredby = "dk"
  copyright = "(C) 1985, for all Countries Chester Music Ltd. 8/9 Frith Street, London W1D 3JB"
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\include "deutsch.ly"

global =  {
	\key c \major
	\time 4/4
	\bar "|."
}

sD = \stemDown
sU = \stemUp
  
RHStimmeEinsNoten = \relative c'' {
%  \voiceOne
  %1
  \repeat unfold 2 { r8 g16[ c] e16[ g, c e] }
  %2
  \repeat unfold 2 { r8 a,16[ d] f16[ a, d f] }
  %3
  \repeat unfold 2 { r8 g,16[ d'] f16[ g, d' f] }
  %4
  \repeat unfold 2 { r8 g,16[ c] e16[ g, c e] }
}

% Assuming voiceThree in Left Hand (context "LinkeHand") and so
goingThreeFromTwo = \change Staff = "LinkeHand" \voiceThree
goingTwoFromThree = \change Staff = "RechteHand" \voiceTwo

RHStimmeZweiNoten = \relative g'{
%  \voiceTwo
%  1
  \repeat unfold 2 { r16 e8.( e4) }
%  2
  \repeat unfold 2 { r16 d8.( d4) }
%  3
  \repeat unfold 2 { r16 d8.( d4) }
%  4
  \repeat unfold 2 { r16 e8.( e4) }
}

LHStimmeEinsNoten = \relative g {
%  \voiceThree
%  1
 c2 c
%  2
 c2 c
%  3
 h2 h
%  4
 c2 c
}

\score {
  <<  % Beide Piano-Systeme müssen gleichzeitig sein
    \new PianoStaff <<
      \new Staff = "RechteHand" <<
        \global  % Taktangabe und Tonart setzen
        \set Staff.midiInstrument = "acoustic grand"
        \clef "treble"
%        \new Voice {
%          \overrideProperty "Score.NonMusicalPaperColumn"
%          #'line-break-system-details #'((Y-offset . 35))
%          s1 * 3 \break
%          s1 * 3 \break
%          s1 * 3 \break
%          s1 * 3
%        }
        \new Voice { \voiceOne \RHStimmeEinsNoten }
        \new Voice { \voiceTwo \RHStimmeZweiNoten }
      >>  % RH Staff-Kontext beenden
      \new Staff = "LinkeHand" <<
        \global
        \set Staff.midiInstrument = "acoustic grand"
        \clef "bass"
%        \new Voice {
%          \overrideProperty "Score.NonMusicalPaperColumn"
%          #'line-break-system-details #'((Y-offset . 35))
%          s1 * 3 \break
%          s1 * 3 \break
%          s1 * 3 \break
%          s1 * 3
%        }
        \new Voice { \voiceThree \LHStimmeEinsNoten }
      >>  % LH Staff-Kontext beenden
    >>  % Klaviersystem beenden
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 64 4)
    }
  }
  % layout important to have both printed score and midi
  \layout {}
}  % Partitur-Kontext beenden

