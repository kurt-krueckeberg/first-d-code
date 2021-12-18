#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.string;
import std.uni;
import std.regex;
import std.regex;
import std.range;

void main(string[] args)
{
 
if (argc != 3) {
   writeln( "Enter the name of input and out files.\n");
   return;
}

  try {
     
     ifile = argv[1];
     ofile = argv[2];

     auto ifile = new File(argv[1], "r");
     auto ofile = new File(argv[2], "w");

     static auto pattern = ctRegex!(`^(.+)\s#\s(.+)`);

     foreach(ifile; byLine) { 

        auto rmatch = matchFirst(line, pattern); 

         writeln("<p>", rmatch.pattern[1], "</p><p>", rmatch.pattern[2], "</p>\n");
     }

   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
