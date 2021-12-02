#!/usr/bin/env rdmd
import std.regex;
import std.stdio;

void splitter_test(in string str, in string regex_)
{
  write(`splitter("`, str, `", `, `regex("`, regex_, `") = `);

  auto array = splitter(str, regex(regex_)); 

  writeln(array);
}

void split_test(in string str, in string regex_)
{
  write("split(\"", str, "\", regex(\"", regex_, "\") = ");

  auto array = split(str, regex(regex_)); 

  writeln(array);
}

void main()
{
  auto str1 = "Das Endspiel # The Final";
  auto regex_str = `([^#]+)\s#\s(.*)$`;

  auto re = regex(regex_str);

  writeln("matchAll(", str1, "regex(" , regex_str, ") = ", matchAll(str1, re));
  writeln();
  writeln("matchFirst(", str1, "regex(" , regex_str, ") = ", matchFirst(str1, re));
  writeln();

  auto str2 = "Das Endspiel # The Final # Third string";

  writeln("matchAll(", str2, "regex(" , regex_str, ") = ", matchAll(str1, re));
  writeln();
  writeln("matchFirst(", str2, "regex(" , regex_str, ") = ", matchFirst(str1, re));
  writeln();

/*
   Or you can use splitter() with a sinlge unique occurance of a regex string like "\s#\s", but
   if it contains other occurances of the "\s#\s" regex, this will be also split out from the string.
   Is splitFirst() the solution? 

TODO:

   Examine the splitter and split examples at https://dlang.org/phobos/std_regex.html
   What is an exmaple of how split and splitter differ, and when you'd prefer split to splitter? 
*/
 
  splitter_test("Das Endspiel # The Final", r"\s#\s"); 
  writeln();

  splitter_test("Das Endspiel # The Final # remainder of line", r"\s#\s"); 
  writeln();

  split_test("Das Endspiel # The Final # remainder of string", r"\s#\s"); 
}
