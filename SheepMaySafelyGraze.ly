\version "2.12.0"

Ae =\markup { \char ##x00C4 }
ae =\markup { \char ##x00E4 }
Oe =\markup { \char ##x00D6 }
oe = \markup { \char ##x00F6 }
Ue =\markup { \char ##x00DC }
ue =\markup { \char ##x00FC }
Sz =\markup { \char ##x00DF }


\header {
  title = \markup {\concat{"Sheeps may safely graze - Schafe k" \oe
 "nnen sicher weiden"}}
  subtitle = "(from Cantata No. 208)"
  source = "Printed Sheet"
  composer = "J. S. Bach"
  enteredby = "dk"
  copyright = "(C) 1985, for all Countries Chester Music Ltd. 8/9 Frith Street, London W1D 3JB"
  maintainer = "Daniel Kahlenberg"
  footer = "Mutopia-2010/08/28"
}

\include "deutsch.ly"

global =  {
	\key g \major
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

  
RHStimmeEinsNoten = \relative c'' {
%  \voiceOne
s1*40
  %1 {{{
  %2
  %3
  %4
  % }}}
  %5 {{{
  %6
  %7
  %8
  % }}}
  %9 {{{
  %10
  %11
  %12
  % }}}
  %13 {{{
  %14
  %15
  %16
  % }}}
  %17 {{{
  %18
  %20
  % }}}
  %21 {{{
  %22
  %23
  %24
  % }}}
  %25 {{{
  %26
  %27
  %28
  % }}}
  %29 {{{
  %30
  %31
  %32
  % }}}
  %33 {{{
  %34
  %35
  %36
  % }}}
  %37 {{{
  %38
  %39
  %40
  % }}}
}

RHStimmeZweiNoten = \relative g'{
%  \voiceTwo
s1*40  
  %1 {{{
  %2
  %3
  %4
  % }}}
  %5 {{{
  %6
  %7
  %8
  % }}}
  %9 {{{
  %10
  %11 +
  %12
  % }}}
  %13 {{{
  %14
  %15
  %16
  % }}}
  %17 {{{
  %18
  %19 oder besser h8 h32 ???
  %20
  % }}}
  %21 {{{
  %22
  %23
  %24
  %}}}
  %25 {{{
  %26
  %27
  %28
  % }}}
  %29 {{{
  %30
  %31
  % }}}
  %33 {{{
  %34
  %35
  %36
  % }}}
  %37 {{{
  %38
  %39
  %40
  % }}}
}

LHStimmeEinsNoten = \relative g {
%  \voiceThree
s1*40  
  %1 {{{
  %2
  %3
  %4
  % }}}
  %5 {{{
  %6
  %7
  %8
  % }}}
  %9 {{{
  %10
  %11 +
  %12
  % }}}
  %13 {{{
  %14
  %15
  %16
  % }}}
  %17 {{{
  %18
  %19
  %20
  % }}}
  %21 {{{
  %22
  %23
  %24
  % }}}
  %25 {{{
  %26
  %27
  %28
  % }}}
  %29 {{{
  %30
  %31
  %32
  % }}}
  %33 {{{
  %34
  %35
  %36
  % }}}
  %37 {{{
  %38
  %39
  %40
  % }}}
}

LHStimmeZweiNoten = \relative c {
%  \voiceFour
s1*40  
  %1 {{{
  %2
  %3
  %4
  % }}}
  %5 {{{
  %6
  %7
  %8
  % }}}
  %9 {{{
  %10
  %11 +
  %12
  % }}}
  %13 {{{
  %14
  %15
  %16
  % }}}
  %17 + 18 {{{
  %18 s. o.
  %19
  %20
  % }}}
  %21 {{{
  %22
  %23
  %24
  % }}}
  %25 {{{
  %26
  %27
  %28
  % }}}
  %29 {{{
  %30
  %31
  %32
  % }}}
  %33 {{{
  %34
  %35
  %36
  % }}}
  %37 {{{
  %38
  %39
  %40
  % }}}
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
          \repeat unfold 4 { s1 * 3 \break } \pageBreak
          \repeat unfold 3 { s1 * 3 \break }
          s1 * 4 \break
          s1 * 3 \break \pageBreak
          \repeat unfold 4 { s1 * 3 \break }
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
          \repeat unfold 4 { s1 * 3 \break } \pageBreak
          \repeat unfold 3 { s1 * 3 \break }
          s1 * 4 \break
          s1 * 3 \break \pageBreak
          \repeat unfold 4 { s1 * 3 \break }
        }
        \new Voice { \voiceThree \LHStimmeEinsNoten }
        \new Voice { \voiceFour  \LHStimmeZweiNoten }
      >>  % LH Staff-Kontext beenden
    >>  % Klaviersystem beenden
  >>
  \midi {
    \context {
      tempoWholesPerMinute = #(ly:make-moment 24 4)
    }
  }
  % layout important to have both printed score and midi
  \layout {
  indent = 1.0\cm
  }
}  % Partitur-Kontext beenden

% vim:syntax=ON:foldmethod=marker:foldmarker={{{,}}}
