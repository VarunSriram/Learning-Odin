package main

import "core:fmt"

//1. A compile-time constant.
//Using `::` means this value is baked in at compile time and cannot change (ie constant)
//Constants use UPPER_SNAKE_CASE convention.
MAX_PLAYERS :: 4


main :: proc() {

    //1. Explicit Declatation
    // name: type = value
    //uses snake_case convention
    player_name: string = "Hero";

    //2. Type Inference (the shorthand)
    // The compiler knows 100 is an int.
    player_health := 100;

    //3. Zero value initialization
    //We declare the type but provide no value. Odin automatically sets this to 0. 
    player_score: int;

    //4. Multiple Assignment
    // You can assign multiple variables on a single line.
    x, y := 10, 20

    fmt.println("Name: ", player_name);
    fmt.println("Health: ", player_health);
    fmt.println("Score: ", player_score);
    fmt.println("Coordinates: ", x, y);
    fmt.println("Max Players: ", MAX_PLAYERS);



}
