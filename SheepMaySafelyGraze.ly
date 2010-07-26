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
  %1
  \repeat unfold 2 { d8 d16 h }   d8 e   e g
  %2
  \repeat unfold 2 { c,8 c16 a }   c8 fis   fis a
  %3
  \repeat unfold 2 { g8 g32 a h16   g h a d, }
  %4
  \repeat unfold 2 { g8 h32 c d16   h g a fis }
  %5
  g8 r8   \relative g' { h a   a4.   h8
  %6
  c4   e8 d   h4   a8 g
  %7
  h8 g fis e   a4.   h8
  %8
  fis4   e8 d   d4   r4 }
  %9
  r8 d16 h   d8 d16 h   d8 e   e g
  %10
  \repeat unfold 2 { e8 e16 c }   e fis   fis a
  %11 +
  %12
  \repeat unfold 2 { d4   e8 d   d h   a g }
}

RHStimmeZweiNoten = \relative g'{
  %1
  \repeat unfold 2 { h8 h16 g }   h8 c   c e
  %2
  \repeat unfold 2 { a,8 a16 fis }   a8 c   a8 c
  %3
  h8 h   s4   e8 e   s4
  %4
  h8 s8   s4   h8 s8   s c
  %5
  h8 s8   \relative c' { d4   e   fis8 g
  %6
  a2   g4   s4
  %7
  s2   e4   s4
  %8
  d4   cis   s2
  %9
  % [1] as VoiceFollower
  %d4   f!8 e   \set followVoice = ##t e4. \change Staff = "LinkeHand" fis?8
  %\change Staff = "RechteHand" }
  % [2] as Glissando + ChangeStaff
  d4   f!8 e   e4.\glissando \change Staff = "LinkeHand" fis?8
  \change Staff = "RechteHand" }
  %10
  s1
  %11 +
  %12
  \repeat unfold 2 { r8   g32 a h16   g h a d   g4 }
  \alternative {
    { c4 }
    { d4 }
  }
}

LHStimmeEinsNoten = \relative g {
  %1
  g2   g
  %2
  fis2.   d4
  %3
  \relative c' { d2   h4.   d8 }
  %4
  g4.   \relative c' { d8    h4   r
  %5
  s2   c4.   d8
  %6
  d2   d4   c8 h
  %7
  d2   cis4   d }
  %8
  s2   fis4   a
  %9
  g2 r
  %10
  s1
  %11 +
  %12
  \repeat unfold 2 { g4.   fis8   g4 }
  \alternative {
    { fis4 }
    { g4 }
  }
}

LHStimmeZweiNoten = \relative c {
  %1
  \repeat unfold 8 { g8 }
  %2
  \repeat unfold 8 { g8 }
  %3
  \relative c' {
  g g fis fis   e e d d
  %4
  c c d d   e d16 c   d8 d'
  %5
  \repeat unfold 8 { g,8 }
  %6
  \repeat unfold 4 { fis }   \repeat unfold 4 { g }
  %7
  \repeat unfold 6 { g } fis g
  %8
  a a } a a   d d c! c
  %9
  h h g g   c c \relative g { h h }
  %10
  s1
  %11 +
  %12
  \repeat unfold 2 { h8 h c c   h g }
  \alternative {
    { a8 a }
    { h8 h }
  }
}


\score {
  <<  % Beide Piano-Systeme müssen gleichzeitig sein
    \new PianoStaff <<
      \new Staff = "RechteHand" <<
        \global  % Taktangabe und Tonart setzen
        \set Staff.midiInstrument = "acoustic grand"
        \clef "treble"
        \new Voice {
%          \overrideProperty "Score.NonMusicalPaperColumn"
%          #'line-break-system-details #'((Y-offset . 35))
          s1 * 3 \break
          s1 * 3 \break
          s1 * 3 \break
          s1 * 3
        }
        \new Voice { \voiceOne \RHStimmeEinsNoten }
        \new Voice { \voiceTwo \RHStimmeZweiNoten }
      >>  % RH Staff-Kontext beenden
      \new Staff = "LinkeHand" <<
        \global
        \set Staff.midiInstrument = "acoustic grand"
        \clef "bass"
        \new Voice {
%          \overrideProperty "Score.NonMusicalPaperColumn"
%          #'line-break-system-details #'((Y-offset . 35))
          s1 * 3 \break
          s1 * 3 \break
          s1 * 3 \break
          s1 * 3
        }
        \new Voice { \voiceThree \LHStimmeEinsNoten }
        \new Voice { \voiceFour  \LHStimmeZweiNoten }
      >>  % LH Staff-Kontext beenden
    >>  % Klaviersystem beenden
  >>
%  \midi {
%    \context {
%      \Score
%      tempoWholesPerMinute = #(ly:make-moment 12 4)
%    }
%  }
}  % Partitur-Kontext beenden

