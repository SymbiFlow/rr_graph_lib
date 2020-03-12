# rr\_graph\_lib

This is an experimental copy of the rr graph libraries from
symbiflow-arch-defs.  This is testing the use of Cython to accelerate writing
capnp RR files.

## Summary of datastructures

TODO: reduce duplication

points
 - class StraightSegment
   - class Type (H, V, S)

tracks
 - class Track
   - direction (X, Y)
 - class Tracks

in channel
 - class _Track
   - class Type (X, Y)
 - class Track
 - class Direction (INC, DEC, BI)

in channel2
 - track is implicit tuple (min, max, idx)
