#!/usr/bin/env rdmd

void main()
{
    import std.regex;
    import std.stdio;
    import std.algorithm.comparison : equal;

    //static  auto pattern = ctRegex!(r"^[^#]+\s#\s.*$"); // todo: add flag/modifier meaning non-greedy evaluation 
    auto pattern = regex(r"^[^#]+\s#\s.*$"); // todo: add flag/modifier meaning non-greedy evaluation 

    auto str = "Die Endspiel war am Juni 10. 1944 # The final was on June 10th 1944";
    
    auto r = splitter(str, pattern); 

    writeln(str.length);    
    writeln(r.length);    
    writeln(r);
    writeln("==================\n");

     //static  auto pattern = ctRegex!(r"^[^#]+\s#\s.*$"); // todo: add flag/modifier meaning non-greedy evaluation 
    auto pattern2 = regex(r"^[^#]+\s#"); // todo: add flag/modifier meaning non-greedy evaluation 

    auto str2 = "Die Endspiel war am Juni 10. 1944 # The final was on June 10th 1944";
    
    auto r2 = matchFirst(str, pattern2); 

    writeln(str2.length);    
    writeln(r2.length);    
    writeln(r2);
    
}
