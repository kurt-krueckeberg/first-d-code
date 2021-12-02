#!/usr/bin/env rdmd
import std.regex;
import std.stdio;

void splitter_test(in string str, in string regex_)
{
  writeln("The input: \"", str, "\"");
  writeln("The length of input = ", str.length);

  writeln("Executing: auto array = splitter(\"", str, "\", regex(\"", regex_, "\");");

  auto array = splitter(str, regex(regex_)); 

  foreach(s; array)  {
      writeln("string of length ", s.length ,": \"", s, "\"");
  }

  writeln("\n============\nwriteln(array):");

  writeln(array);
}

void main()
{
  splitter_test(", abc, de,  fg, hi, ", ", *");
  writeln("=================");
  splitter_test("Das Endspiel # The Final", r"[^#]+\s#"); 
}
