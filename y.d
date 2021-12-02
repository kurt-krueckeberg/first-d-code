#!/usr/bin/env rdmd
import std.regex;
import std.stdio;

void main()
{
  auto str = "Das Endspiel # The Final #x# #";

  auto re2 = regex(`\s#\s`);

  auto array2 = split(str, re2);

  writeln(array2);

}
