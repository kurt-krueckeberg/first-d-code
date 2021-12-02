#!/usr/bin/env rdmd
import std.exception;
import std.stdio;
import std.string;
import std.regex;
import std.range;

void write_line(File file, string[] parts)
{
// TODO: Finish porting ~/php-util/mk-util writing-of-output method.
        
  if (parts[0] == '-') {
       
      par = "<p class='new-speaker'>"; 
      first = substr(parts[0], 2);

      if ($matches[2][0] == '-') // When the German string starts with a dash followed by a blank ("- "), the English sometimes doesn't so check.
          $matches[2] = substr($matches[2], 2); 
      
  } else 

     par = "<p>";
   
  file.write(ofile, par, part1, "</p>", part2, "</p>\n");                
}

void main(string[] args)
{
   if (args.length != 3) {
      writeln("Enter both the name of input file followed by the name of the output file.");
      return;
   }

   auto in_file = args[1];
   
   auto out_file = args[2];
   
   try {

      auto ifile = File(in_file, "r");
      auto ofile = File(out_file, "w");

      static auto pattern = ctRegex!(`\s#\s`);

      foreach (line; ifile.byLine) {

          auto result = split(line, pattern); 
          writeln(result);
      }


   } catch ( ErrnoException e) { // FileException is unidentified.

      writeln(e.msg); 
      writeln(e.file); 
      writeln(e.line); 
       
   } finally {

   }
}
