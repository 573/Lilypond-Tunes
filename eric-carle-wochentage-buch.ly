\header {
           title = "Und heut ist Montag"
           subtitle = "(tune)"
           composer = "Eric Carle"
           meter = ""
           piece = ""
	   enteredby = "dk"
	   copyright = "Applies unmodified."
	   maintainer = "Daniel Kahlenberg"
	   footer = "Mutopia-2005/06/23"
           tagline = \markup {
             \column {
               "LilyPond file by Daniel Kahlenberg,"
               "Leipzig 17/03/2008"
             }
           }
           texidoc = "From the Eric Carle book
                      Und heut ist Montag."
         }
         
         #(set-global-staff-size 16)
         \include "english.ly"
         
         %%%%%%%%%%%% Some macros %%%%%%%%%%%%%%%%%%%
         
         sl = {
           \override NoteHead #'style = #'slash
           \override Stem #'transparent = ##t
         }
         nsl = {
           \revert NoteHead #'style
           \revert Stem #'transparent
         }
         cr = \override NoteHead #'style = #'cross
         ncr = \revert NoteHead #'style
         
         %% insert chord name style stuff here.
         
         jzchords = {
	 	 }
         
         
         %%%%%%%%%%%% Keys'n'thangs %%%%%%%%%%%%%%%%%
         
         global = {
           \time 4/4
         }
         
         Key = { \key g \major }
         
         
         % ------ Trombone ------
         tbone = \relative c {
           \Key
         }
         tboneharmony = \chordmode {
           \jzchords
         }
         trombone = {
           \global
           \set Staff.instrumentName = #"Trombone"
           \clef bass
           <<
             \tbone
           >>
         }
         
         % ############ Rhythm Section #############
	 looponeheadvarone =
	  \chordmode {
	   bf1.:maj7 r8. bf16:maj7 r4				
	 }

         % ------ Guitar ------
         gtrscheme = {
	 }

	 gtrrhythms = \context Voice {
	   \gtrscheme
	 }
	 
         gtrharmonies = \context ChordNames {
           %\jzchords
	   \gtrscheme
	 }

         guitar = {
           \global
           \set Staff.instrumentName = #"Rhythmic"
           \clef treble
           <<
             \gtrrhythms
           >>
         }

	 % ------ Bass Guitar ------
         Bass = \relative c {
           \Key
         }
         
	 bass = {
           \global
           \set Staff.instrumentName = #"Bass"
           \clef bass
           <<
             \Bass
           >>
         }
         
	 melos = \context Voice {
	   \partial 2
	   r8. d16 g8. a16
	   \repeat volta 2 {
	     b4 d,4~ d8. d16 g8. a16
	     b4 d,2 r4 \break %b	
	     b' b b d
	     b8. a16 b8. a16 b4 d \break %b
	     b8. b16 a8. b16 g8 r16 d g8. a16
	     b4 d,4~ d8. d16 g8. a16
	     b4 d,2 r4 \break %b
	     a'4 a8. a16 a4 d
	     b b b d
	     b8. a16 b8. a16 b4 d \break %b
	   }
	   \alternative {
	     {
	       b8. b16 a8. a16 g8 r16 d g8. a16
	     }{
	       b8. b16 a8. a16 g2~
	       g2
	     }
	   }
	 }
         
         %% ------ Piano ------
         rhUpper = \relative c' {
	   %\voiceOne
	   \Key
	   \melos
	 }

         rhLower = \relative c' {
           \voiceTwo
           \Key
         }
         
         lhUpper = \relative c' {
           \voiceOne
           \Key
         }

         lhLower = {
           \voiceTwo
           \Key
         }

         PianoRH = {
           \clef treble
           \global
           \set Staff.midiInstrument = "muted trumpet"
           <<
             \new Voice = "one" \rhUpper
	     % Dont use Left Hand Lower Structure Voice now
             %\new Voice = "two" \rhLower
           >>
         }
         PianoLH = {
           \clef bass
           \global
           \set Staff.midiInstrument = "acoustic grand"
           <<
             %\new Voice = "one" \lhUpper
             \new Voice = "two" \lhLower
           >>
         }
         
         piano = {
           <<
             \set PianoStaff.instrumentName = #"Piano"
             \new Staff = "upper" \PianoRH
             %\new Staff = "lower" \PianoLH
           >>
         }
         
         % ------ Drums ------
         up = \drummode {
           hh4 <hh sn>4 hh <hh sn> hh <hh sn>4
           hh4 <hh sn>4
           hh4 <hh sn>4
           hh4 <hh sn>4
         }
         
         down = \drummode {
           bd4 s bd s bd s bd s bd s bd s
         }
         
         drumContents = {
           \global
           <<
             \set DrumStaff.instrumentName = #"Drums"
             \new DrumVoice { \voiceOne \up }
             \new DrumVoice { \voiceTwo \down }
           >>
         }
         
         %%%%%%%%% It All Goes Together Here %%%%%%%%%%%%%%%%%%%%%%
         
         \score {
	 << \new StaffGroup = "rhythm" <<
	    \new PianoStaff = "piano" \piano
	  >> >>
	    %\new ChordNames = "harmonies" {
	    %	\set chordChanges = ##t
	    %	\gtrharmonies }
	    %\new Voice = "rhythms" \gtrrhythms
	    %\new Staff = "bass" \bass

%	<<
%             \new StaffGroup = "pads" <<
%               \new Staff = "trombone" \trombone
%            >>
         
%             \new StaffGroup = "rhythm" <<
%               \new PianoStaff = "piano" \piano
%               \new Staff = "bass" \bass
%               %\new DrumStaff { \drumContents }
%             >>
%           >>
         
           \layout {
             \context { \RemoveEmptyStaffContext }
             \context {
               \Score
		% To fit: bar number, Original #3
              \override BarNumber #'padding = #4
               \override RehearsalMark #'padding = #2
               %skipBars = ##t
             }
           }
         
           \midi { }
         }
