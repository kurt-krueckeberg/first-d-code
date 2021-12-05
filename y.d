import std.exception;
import std.stdio;
import std.string;
import std.uni;
import std.regex;
import std.range;

void write_line(string[] parts)
{
  writeln("In write_line(string[] parts)");
}

void main()
{
   
    static auto pattern = ctRegex!(`\s#\s`); 
    
    auto a = "Learning D is fun".split!isWhite;
    
    auto result = "Learning D is fun".split!isWhite;
        
    write_line(a);
    
    auto x = split("Guten Tag # Hi", pattern);
      
    write_line(a);
}
