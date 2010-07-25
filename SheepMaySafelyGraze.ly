\version "2.12.0"

\header {
  title = "Sheeps may safely graze - Schafe können sicher weiden (from Cantata No. 208)"
  source = "Printed Sheet"
  composer = "J. S. Bach"
  enteredby = "dk"
  copyright = "(C) 1985, for all Countries Chester Music Ltd. 8/9 Frith Street, London W1D 3JB"
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\include "deutsch.ly"

global =  {
	\key g \major
	\time 4/4
	\bar "|."
}

  
RHStimmeEinsNoten = \relative c'' {
  \repeat unfold 2 { d8 d16 h }   d8 e   e g

  \repeat unfold 2 { c,8 c16 a }   c8 fis   fis a

  \repeat unfold 2 { g8 g32 a h16   g h a d, }

  \repeat unfold 2 { g8 h32 c d16   h g a fis }

  g8 r8   \relative g' { h a   a4.   h8

  c4   e8 d   h4   a8 g

  h8 g fis e   a4.   h8

  fis4   e8 d   d4   r4 }
}

RHStimmeZweiNoten = \relative g'{
  \repeat unfold 2 { h8 h16 g }   h8 c   c e

  \repeat unfold 2 { a,8 a16 fis }   a8 c   a8 c

  h8 h   s4   e8 e   s4

  h8 s8   s4   h8 s8   s c

  h8 s8   \relative c' { d4   e   fis8 g

  a2   g4   s4

  s2   e4   s4

  d4   cis   s2 }
}

LHStimmeEinsNoten = \relative g {
  g2   g

  fis2.   d4

  \relative c' { d2   h4.   d8 }

  g4.   \relative c' { d8    h4   r

  s2   c4.   d8

  d2   d4   c8 h

  d2   cis4   d }

  s2   fis4   a
}

LHStimmeZweiNoten = \relative c {
  \repeat unfold 8 { g8 }
  
  \repeat unfold 8 { g8 }

  \relative c' {
  g g fis fis   e e d d

  c c d d   e d16 c   d8 d'

  \repeat unfold 8 { g,8 }

  \repeat unfold 4 { fis }   \repeat unfold 4 { g }

  \repeat unfold 6 { g } fis g

  a a } a a   d d c! c
}


\score {
  <<  % Beide Piano-Systeme müssen gleichzeitig sein
    \new PianoStaff <<
      \new Staff = "RechteHand" <<
        \global  % Taktangabe und Tonart setzen
        \set Staff.midiInstrument = "acoustic grand"
        \clef "treble"
        \new Voice { \voiceOne \RHStimmeEinsNoten }
        \new Voice { \voiceTwo \RHStimmeZweiNoten }
      >>  % RH Staff-Kontext beenden
      \new Staff = "LinkeHand" <<
        \global
        \set Staff.midiInstrument = "acoustic grand"
        \clef "bass"
        \new Voice { \voiceThree \LHStimmeEinsNoten }
        \new Voice { \voiceFour  \LHStimmeZweiNoten }
      >>  % LH Staff-Kontext beenden
    >>  % Klaviersystem beenden
%    \layout {
%      \context {
%        \PianoStaff
%			  \accepts Dynamics
%			  \override VerticalAlignment #'forced-distance = #14
%       }
%     }
%	   \midi {
%       \context {
%         \PianoStaff
%         \accepts Dynamics
%         % TODO ignored
%         tempoWholesPerMinute = #(ly:make-moment 30 2)
%       }
%     }
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 12 4)
    }
  }
}  % Partitur-Kontext beenden

