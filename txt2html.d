#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.regex;
import std.range;

void main(string[] args)
{
   try {

      auto file = File("./text.txt", "r");

      static auto pattern2 = ctRegex!(`\s#\s`);

      /*
       * Files tutorial: http://nomad.uk.net/articles/more-hidden-treasure-in-the-d-standard-library.html
       */

/*
      static auto pattern = ctRegex!(r"^([^#]+)\s#\s(.*)$"); // todo: add flag/modifier meaning non-greedy evaluation 

      foreach (line; file.byLine) {

          auto match = matchAll(line, pattern); // matchAll() vs just simply match the regex 
          writeln(match.hit);
      }
*/
      foreach (line; file.byLine) {

          auto result = split(line, pattern2); // matchAll() vs just simply match the regex 
          writeln(result);
      }


   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
