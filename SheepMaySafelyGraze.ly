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
  g8 r8   \relative g' { h8 a   a4.   h8
  %6
  c4   e8 d   h4   a8 g
  %7
  h8 g fis e   a4.   h8
  %8
  fis4   e8 d   d4   r4 }
  %9
  r8 d16 h   d8 d16 h   d8 e   e g
  %10
  \relative g' { \repeat unfold 2 { e8 e16( c) }   e8( fis)   fis( a) }
  %11 +
  %12
  \repeat unfold 2 { d4(   e8 d   d h   a g) }
  %13
  c4.(   d8   h a g a
  %14
  fis4.   g8 )g   d'16( h)   d8 d16( h)
  %15
  d8( e)   e( g)   e( c   h a
  %16
  d4.   e8   h4.   a16 g
  %17
  ) g8   \relative c'' { d16( h)   d8 d16( h)   d8( e)   e( g) }
  %18
  c8 c16( a)   c8 c16( a)   c8( fis)   fis( a)
  %19
  \repeat unfold 2 { g8( g32) a h16   g h a d, }
  %20
  \repeat unfold 2 { g8 h32( c d16   h g a fis ) }
  %21
  g4   e(   dis4.   e8
  %22
  c4   h   g)   {fis8( e}
  %23
  a4   {h8 gis}   a4.)   h8(
  %24
  c4   {d8 h}   c4)   {e8( d}
  %25
  s1
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
  \repeat unfold 2 { r8   g32 a h16   g h a d,   g4 }
  \alternative {
    { c,4 }
    { d4 }
  }
  %13
  e8 e fis fis   d c d e
  %14
  d8 d d c   h   h'16( g)   h8 h16( g)
  %15
  h8 c   c e   \relative c' { \change Staff = "LinkeHand" c8 c16 a   c8 c16 a
  \change Staff = "RechteHand" }
  %16
  \relative c' { fis8 g g g   \relative g { r h32 c d16\glissando \change Staff =
  "LinkeHand" \stemUp h16 g d fis \change Staff  = "RechteHand" }}
  %17
  h,8   \relative g' { h16( g)   h8 h16( g)   h8( c)   c( e) }
  %18
  \relative c'' { a8 a16( fis)   a8 a16( fis)   a8( c)   a( c)
  %19 oder besser h8 h32 ???
  h8( h)   r4   e8( e)   r4
  %20
  h4   r   h4   r8 c }
  %21
  \relative g' { h4 h a g
  %22
  a4 fis } s h
  %23
  e4 d e d
  %24
  e4 {f!8 d} e4 e
  %25
  s1
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
  \relative g' { g4\glissando \change Staff = "RechteHand" h8 a \glissando
  \change Staff = "LinkeHand" fis4 e8 d }
  %11 +
  %12
  \repeat unfold 2 { g4.   fis8   g4 }
  \alternative {
    { fis4 }
    { g4 }
  }
  %13
  % Hals vom g4 muss nach oben, damit Verschmelzung gelingt
  a2   g4   s4
  %14
  s2   g
  %15
  g2   g8 g fis fis
  %16
  \relative c' { c8 h   c4   g   s4 }
  %17
  g4   f!   e   c
  %18
  fis?2.   d4
  %19
  \relative c' { d2   h4.   d8 }
  %20
  g4.   \relative c' { d8   h4   r8 d8 }
  %21
  {g8} r \relative c' { e4 h2
  %22
  e4 dis\glissando \change Staff = "RechteHand" e\glissando \change Staff = "LinkeHand"
} % relative
  gis
  %23
  a4 gis a e
  %24
  a4 f! e gis
  %25
  s1
}

LHStimmeZweiNoten = \relative c {
  %1
  \repeat unfold 8 { g8 }
  %2
  \repeat unfold 8 { g8 }
  %3
  \relative c' {
  g8 g fis fis   e e d d
  %4
  c8 c d d   e d16 c   d8 d'
  %5
  \repeat unfold 8 { g,8 }
  %6
  \repeat unfold 4 { fis8 }   \repeat unfold 4 { g8 }
  %7
  \repeat unfold 6 { g8 } fis g
  %8
  a8 a } a a   d d c! c
  %9
  h8 h g g   c c \relative g { h h
  %10
  a8 a a a   d d c c }
  %11 +
  %12
  \repeat unfold 2 { h8 h c c   h g }
  \alternative {
    { a8 a }
    { h8 h }
  }
  %13
%  \mergeDifferentlyHeadedOn
 % \mergeDifferentlyDottedOn  
  a8 a d d   \stemUp g, a h c
 % \mergeDifferentlyHeadedOff
%  \mergeDifferentlyDottedOff 
  %14
  d8 d d, d   g g g g
  %15
  g8 g g g   s2
  %16
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn  
  g'8 g c, c   d d d d
  \mergeDifferentlyHeadedOff
  \mergeDifferentlyDottedOff 
  %17 + 18
  \relative c { \repeat unfold 2 { \repeat unfold 8 { g8 } } }
  %18 s. o.
  %19
  g8 g fis fis   e e d d
  %20
  c8 c d d   e d16 c   d8 d
  %21
  {\relative c { g } g g g } {fis fis g g}
  %22
  {a a h h} \relative c { {e e d! d}
  %23
  {c c h h} {c c gis gis}
  %24
  {a a gis gis} {a a h h} }
  %25
  s1
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
        \new Voice { \voiceFour  \LHStimmeZweiNoten }
      >>  % LH Staff-Kontext beenden
    >>  % Klaviersystem beenden
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 12 4)
    }
  }
  % layout important to have both printed score and midi
  \layout {}
}  % Partitur-Kontext beenden

