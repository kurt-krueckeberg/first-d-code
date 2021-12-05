#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.string;
import std.uni;
import std.regex;
import std.range;

/*
 * Comment In D, type 'char' and type 'string' have default character encodings of UTF-8. 
 */

void write_line(File ofile, char[][] parts)
{
  string par = "<p>";

  if (parts[0][0] == '-') {

      // TODO: Q: Do I want to use the hardcoed value of 2? Maybe I should look at: compPrefix(parts[0], "- ");
      par = "<p class='new-speaker'>"; 

      parts[0] = parts[0][2 .. $]; //   German subtitle. 

      if (parts[1][0] == '-') // Does the English translation of the German subtitle aslo start with a dash followed by a blank ("- ")? Sometimes its doesn't, so we check.
         parts[1] = parts[1][2 .. $]; 
  } 
   
  ofile.write(par, parts[0], "</p>", parts[1], "</p>\n");                
}

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

          auto result = split(line, pattern); 
          write_line(ofile, result);
      }


   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
