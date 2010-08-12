\version "2.12.0"

\header {
  title = "Traumfresserchen"
  source = "Printed Sheet"
  composer = "J. S. Bach"
  enteredby = "dk"
  copyright = "(C) 1985, for all Countries Chester Music Ltd. 8/9 Frith Street, London W1D 3JB"
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2005/06/23"
}

\include "deutsch.ly"

global =  {
	\key fis \major
	\time 4/4
	\bar "|."
}

sD = \stemDown
sU = \stemUp
  
RHStimmeEinsNoten = \relative c'' {
%  \voiceOne
  %1
  e4 e8 e e4
  %2
  e4 d8 d d4
  %3
  r1
  %4
  d4 \relative c { h } d
  %5
  d4 cis8 cis cis4
  %6
  r1
  %7
  cis4 d cis
  %8
  cis4 h8 h h4
  %9
  r1
  %10
  h4 cis d
  %11
  fis4 e8 e e4
  %12
  r1
  %13
  e2( fis4)
  %14
  e2( d4)( 
  %15
  d2 r4
  %16
  d2( e4)
  %17
  d2( cis4)(
  %18
  cis2) r4
  %19
  cis2 d4
  %20
  cis2( h4)
  %21
  h2.
  %22
  h2( a4)
  %23
  a2.(
  %24
  a4) r4 r4
  %25
  \key c \major
  e4 a h
  %26
  c4 h a
  %27
  e2.(
  %28
  e2) r4
  %29
  e4 a h
  %30
  c h a
  %31
  fis2.(
  %32
  fis2) r4
  %33
  fis4 g a
  %34
  h4 a g
  %35
  fis4 g a
  %36
  h2 r4
  %37 Rit... ab letzterr 4tel
  c4 h a
  %38 ... und Fermate am Taktanfang
  gis2.(
  %39
  gis2) r4
  %40  A TEMPO
  \key fis \major
  e4 e8 e e4
  %41
  e4 d8 d d4(
  %42
  d2) r4
  %43 Rit... letzte 4tel
  h4 h a
  %44 Fermate Anfang
  c2.(
  %45
  c2) r4
}

% Assuming voiceThree in Left Hand (context "LinkeHand") and so
goingThreeFromTwo = \change Staff = "LinkeHand" \voiceThree
goingTwoFromThree = \change Staff = "RechteHand" \voiceTwo

RHStimmeZweiNoten = \relative g'{
%  \voiceTwo
  %1
  \repeat unfold 2 { h8 h16 g }   h8[ c]   c e
  %2
  \sU \repeat unfold 2 { a,8 a16 fis }   \sD a8[ c]   a8 c
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
  d4   f!8 e   e4.\glissando \goingThreeFromTwo fis?8
  \goingTwoFromThree }
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
  h8 c   c e   \relative c' { \goingThreeFromTwo c8 c16 a   c8 c16 a
  \goingTwoFromThree }
  %16
  \relative c' { fis8 g g g   \relative g { r h32 c d16\glissando
  \goingThreeFromTwo \stemUp h16 g d fis \goingTwoFromThree }}
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
  e4 a e {e8 f!}
  %26
  a4 gis e8 \relative g' { {c16 a} {c8 c16 a}
  %27
  {c8 d d fis} } \relative c'' { {h8 h16 gis} {h8 h16 gis}
  %28
  {h8 d} {h d} {c( c)} } s4
  %29
  \relative c'' { {f8( f)} } s4 {a8 s} {s h}
  %30
  {c8 c32( d e16} {c a h gis)} e4( c
  %31
  d4) d e2
  %32
  fis4 r4 fis2
  %33
  fis8 e  g4  g2 
  %34
  \relative c' { <cis fis>4  ais8 cis }  a!2(
  %35
  a4)\glissando\goingThreeFromTwo g8[ a16 fis]  g2(
  %36
  g8) fis  fis4\glissando\goingTwoFromThree
  \relative c'' { c!2(\(
  %37
  c4\)  h8[) d16( cis]  d2\(
  %38
  d8[\) cis]  h8[ cis)]  cis4(  h8 a
  %39
  g4  fis8[ g16( e]  a16[ g fis g]  a16[ g a h] }
  %40
  s2 d2)
}

LHStimmeEinsNoten = \relative g {
%  \voiceThree
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
  \relative g' { g4\glissando\goingTwoFromThree h8 a \glissando
  \goingThreeFromTwo fis4 e8 d }
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
  e4 dis\glissando\goingTwoFromThree e\glissando\goingThreeFromTwo
} % relative
  gis
  %23
  a4 gis a e
  %24
  a4 f! e gis
  %25
  a2 h4 {a8} \goingTwoFromThree d8
  %26
  e4 d c8 r r4 \goingThreeFromTwo
  %27
  a2 gis
  %28
  e2 \relative c' { e
  %29
  c4. e8 a,4 e'4
  %30
  c4 r8 d8 c8 r r4
  %31
  g2 a
  %32
  a4 ais h2 }
  %33
  g4 fis e2
  %34
  \relative g, { fis4 } s4 fis h4
  %35
  \relative g { e4 }  \goingTwoFromThree \relative c''
  { r4 e4  cis8[ cis16 a]
  %36
  cis8[ d] d[ fis] } \goingThreeFromTwo d2
  %37
  d2  h
  %38
  e2  e8[ e16 cis]  d8 r8
  %39
  a2  a4  h
  %40
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
  {a8 a h h} \relative c { {e e d! d}
  %23
  {c8 c h h} {c c gis gis}
  %24
  {a8 a gis gis} {a a h h}
  %25
  {c8 c d d} {d d c d}
  %26
  {e8 e \relative g, { e e }} \relative g, { {a a a a}
  %27
  {a8 a a a} {a a a a}
  %28
  {a8 a a a} } {a a g! g} }
  %29
  {f!8 f e e} {d d e e}
  %30
  {f!8 e16 d} {e8 e} a \relative g, { { a a a }
  %31
  {h8 h h h} {cis cis cis cis}
  %32
  {d8 d cis cis} {h8 h h h}
  %33
  g8 g fis fis  e e e e }
  %34
  fis8 fis e e  dis dis h h
  %35
  \relative g' { e8 e d! d  cis cis a a
  %36
  d8 d d d }  d d d d
  %37
  g8 g fis fis  e e e e
  %38
  a8 a a a  g! g fis fis
  %39
  e8 e e e  fis fis g g
  %40
  a8 a \relative g, { a a  <d fis>[ <fis a>] <fis a>[ <a c!>] }
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

