package main

import "core:fmt"

VERSION :: 1.0

main :: proc(){
    character_name := "Varun";
    is_alive := true;
    experience_points: int;

    fmt.println("Character name:",character_name);
    fmt.println("Is alive?",is_alive);
    fmt.println("Experience points", experience_points);
    fmt.println("Version: ", VERSION);
}