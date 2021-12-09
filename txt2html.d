#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.string;
import std.uni;
import std.regex;
import std.range;

/*
 * In D, types 'char' and 'string' are both built-in types and bot are UTF-8 character-encoded characters. wchar is utf-16 and dchar is utf-32. 
 */

void main(string[] args)
{
   if (args.length != 3) {

      writeln("Enter the name of input file followed by the name of the output file.");
      return;
   }
   
   try {

      auto ifile = File(args[1], "r");
      auto ofile = File(args[2], "w");

      static auto pattern = ctRegex!(`\s#\s`); // Do compile-time regular expression Regex object creation. 

      foreach (line; ifile.byLine) {

          auto parts = split(line, pattern); 

          auto par = parts[0][0] == '-' ?  "<p class='new-speaker'>" : "<p>";

           // Q: Do I want to use the hardcode value of 2? Maybe I should look at: compPrefix(parts[0], "- ");
           ofile.writeln(par, '-' ? parts[0][2 .. $] : parts[0], "</p>", par,'-' ? parts[1][2 .. $] : parts[1], "</p>");                
      }


   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
