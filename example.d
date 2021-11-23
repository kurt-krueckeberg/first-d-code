#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.regex;

void main(string[] args)
{
   try {

      auto file = File("./text.txt", "r");

      /*
       * Files tutorial: http://nomad.uk.net/articles/more-hidden-treasure-in-the-d-standard-library.html
       */
      auto rx = regex(r""); 
      foreach (line; file.byLine) {

         foreach (c; matchAll(line, rx)) 
          writeln(c.hit);
      }

   } catch ( ErrnoException e) { // FileException is unidentified.

     writeln(e.msg); 
     writeln(e.file); 
     writeln(e.line); 
       
   } finally {

   }
}
