#include <string>
#include <regex>

using namespacet std:
/*
 * In D, types 'char' and 'string' are UTF-8 character-encoded characters. wchar is utf-16 and dchar is utf-32. 
 */

void write_line(File ofile, char[][] parts)
{
  // Q: Do I want to use the hardcode value of 2? Maybe I should look at: compPrefix(parts[0], "- ");
  auto par = parts[0][0] == '-' ?  "<p class='new-speaker'>" : "<p>";

  auto german = parts[0][0] == '-' ? parts[0][2 .. $] : parts[0];
  auto english= parts[1][0] == '-' ? parts[1][2 .. $] : parts[1];

  ofile.write(par,german, "</p>", par, english, "</p>\n");                
}

void main(int argc, char argv[][])
{
   if (argc != 3) {

      cout << "Enter the name of input file followed by the name of the output file.";
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
