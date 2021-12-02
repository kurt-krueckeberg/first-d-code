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
//--  splitter_test(", abc, de,  fg, hi, ", ", *");
//--  splitter_test("Das Endspiel # The Final", r"[^#]+\s#"); 

  // matchAll() seems to works like preg_match()

  write(`The output of matchAll("Das Endspiel # The Final", `, `regex("([^#]+)\s#\s(.*)$")`, " is:  ");

  auto x = matchAll("Das Endspiel # The Final, ", r"([^#]+)\s#\s(.*)$"); 
  writeln(x);

  writeln("--------------------\n");

 /*
   Or you can use splitter() with a sinlge unique occurance of a regex string like "\s#\s", but
   if it contains other occurances of the "\s#\s" regex, this will be also split out from the string.
   Is splitFirst() the solution? 

   TODO:
   Examine the splitter and split examples at https://dlang.org/phobos/std_regex.html
  */
 
  splitter_test("Das Endspiel # The Final", r"\s#\s"); 

  splitter_test("Das Endspiel # The Final # remainder of line", r"\s#\s"); 

  split_test("Das Endspiel # The Final # remainder of string", r"\s#\s"); 
}
