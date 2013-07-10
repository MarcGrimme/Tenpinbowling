# Ten Pin Bowling

Just a small implementation of Ten Pin Bowling.

For rules see [Wikipedia on Ten Pin Bowling/Rules and Regulations](http://en.wikipedia.org/wiki/Ten-pin_bowling#Rules_and_regulations)

# Architecture

The game is build as ruby gem but can also be used when just downloading the files with given directory structure.
This is no kind of reference implementation but just a test for me to evaluate some things related to gems testing and more.
There is NO guaranty on functionality.
Comments are nevertheless wellcome ;-).

## Installation

Either just install the gemfile as follows:

<blockquote>
    gem install ten_pin_bowling-0.1.gem
</blockquote>

or download the source by cloning the git repository:

<blockquote>
   git clone https://github.com/grimme-atix-de/Tenpinbowling.git
</blockquote>


## Design

The whole library for Ten Pin Bowling can be found in the lib Directory. There is only one library file called
ten_pin_bowling.rb that holds the module TenPinBowling.

This module has two classes Frames and Frame in reference to the TenPinBowling namespace.
`TenPinBowling::Frames` is an extension of the Array class but only holds up to ten `TenPinBowling::Frame`s.
A frame is about the score of two or three (only optional for the tenth frame) thrown balls.

The constructor of `TenPinBowling::Frames` takes either an array of `TenPinBowling::Frame` or and array of two
dimensional arrays. It automatically builds a frame structure from it. To help constructing a `TenPinBowling::Frames`
from a one dimensional array the static factory method `TenPinBowling::Frames.from_balls` can be used. This method takes
a one dimensional array of up to 20-21 ball throws (see below).

### TenPinBowling::Frame

The frame class represents a frame in this game. This is either the score of one (if all ten pins are being knocked down)
two (normal case) or three balls (if a strike has been made in the tenth frame).

So the constructor (`initialize`) takes one, two or three arguments that represent the frame being made.

Additionally there are three more relevant methods:

* score: returns the score of this frame (not including the relevant following scores)
* strike: true if the first ball is a strike.
* spare: if ten balls have been knocked down by two balls in a frame.

### TenPinBowling::Frames

This class represents a collection of maximum ten frames. The constructor accepts either an array of `Frames` or an array
of two dimensional arrays (the last might also be three dimensional).

There are three more relevant methods:

* score(index): returns the real score of this very frame (index is the index of the frame in this game starting at 1 for
                the first frame.
* score_accumulated(index): will return the accumulated score of this frame (including the score of all subsequent frames).
* from_balls(*array): returns a new Frames class with the given array as frames. The array might be a collection of
                      `String`s or `Fixnum`s that will be added to their respective frame.

### bin/ten_pin_bowling

Is the executable to show the functionality.

It just parses either from `stdin` or from the command line parameters as many scores of balls that are possible and
constructs the appropriate frames instance. It will then return the accumulated score of this game by calling the
`TenPinBowling::Frames::score_accumulated` method for the `frames` instance.

# Testing

The test directory shows two rspec tests that validate a few functions that should be available.

Just call `rspec <testfilename` to see the output.

## score_spec.rb

Tests the score and score_accumulated methods. It would certainly be better to refactor that test in smaller tests but
because of too few time its just so.

## from_balls_spec.rb

Tests the `TenPinBowling::Frames::from_balls` static method.

# Example

Let's look how its working.

Let's say you made a game as follows:

1. Frame1: 10, 0 => Strike
2. Frame2: 10, 0 => Strike
3. Frame3: 3,6
4. Frame4: 1,4
Rest are 0 frames to make the example more descriptive.

Then you would call the program ten_pin_bowling as follows:

## Read from stdin

Just call `bin/ten_pin_bowling` without parameters:

<blockquote>
<pre>
    ruby ./bin/ten_pin_bowling
    Please type the score you have made with your last ten pin bowling game.
    Just type the score of each ball separated with a blank. Missing balls will be filled in with 0 value.
    Only the first 20 balls are accepted. If the last 'frame' is a strike two more balls are needed (22).
    If the last 'frame' is a spare one more ball is needed (21).
    You'll then see the overall score of the game.
    For a strike either a 10 or a 'X' is accepted.
    For a 0 ball either a 0 or any non number character is accepted.
    All other inputs are figures from 1..9.
    10 0 10 0 3 6 1 4
    The accumulated score of this game is 56
</pre>
</blockquote>

## Read from parameters

Just call `bin/ten_pin_bowling` with parameters as the balls being thrown.

<blockquote>
<pre>
    $ ruby ./bin/ten_pin_bowling 10 0 10 0 3 6 1 4
    The accumulated score of this game is 56
</pre>
</blockquote>

## 2nd perfect game

This is the example for a perfect game. Note the x for strike and a or whatever character for 0.

<blockquote>
<pre>
    # Frames                   1     2     3     4     5     6     7     8    9    10
    ruby ./bin/ten_pin_bowling 10 0  10 0  10 0  10 0  10 0  10 0  10 0  x a  X 0  10 10 10
    The accumulated score of this game is 300
</pre>
</blockquote>