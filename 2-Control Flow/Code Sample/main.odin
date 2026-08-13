package main

import "core:fmt"

Game_State :: enum{
    Menu,
    Playing,
    Paused,
    Game_Over,
}

main :: proc() {
    //1. Scoped IF statement
    //current_health only exits inside this if/else block.

    if current_health := 100; current_health > 0 {
        fmt.println("Player is Alive with", current_health, "HP.");
    }
    else {
        fmt.printfln("Player is dead");
    }

    //2. The Unified for loop (range)
    // ..< denotes a half-open interval (excludes upper limit)
    fmt.println("Spawning 3 enemies")
    for i in 1..<4 {
        fmt.println(" - Spawned enemy ID:", i)
    }

    // 3. EXPLICIT SWITCH STATEMENT
    state := Game_State.Playing

    fmt.print("Current Engine State: ")
    switch state {
    case .Menu:
        fmt.println("Loading UI...")
    case .Playing:
        fmt.println("Updating game logic...")
        // No 'break' needed here! [cite: 456]
    case .Paused:
        fmt.println("Game frozen.")
    case .Game_Over: // The newly handled case!
        fmt.println("Player died. Showing restart screen.")    
    }

    //Conditionless switch
    //If you omit the condition variable next to the switch keyword odin treats it as true
    //This allows you to evaluate completely separate boolean expressions in each case.
    //Useful for clean if-else chains

    player_health := 45
    is_shielded := true
    switch {
        case player_health <= 0:
            fmt.println("Player is dead.")
        case is_shielded && player_health < 50:
            fmt.println("Player is taking heavy fire but shields are holding!")
        case player_health > 90:
            fmt.println("player is in great shape")
        case:
            fmt.println("standard conditions")
    }

    /*
    Matching Ranges and Multiple Values
    You don't have to write a separate case for every single number.
    A switch statement can evaluate multiple comma-separated values on a single line, 
    and it can also use ranges exactly like a range-based
    */

    roll := 14
    switch roll {
        case 1,2,3:
            fmt.println("Critical Failure.")
        case 4 ..=10: //closed interval (includes 10)
            fmt.println("miss.")
        case 11 ..<20: //half-open interval (excludes 20)
            fmt.println("Hit.")
        case 20:
            fmt.println("Critical Hit!")
    }

    /*
    Explicit Fallthrough
    Odin prevents accidental bugs by ensuring switch cases do not fall through to the next block by default. 
    However, if you want that C-style cascading behavior, you can explicitly force it using the fallthrough keyword.
    */

    access_level := 2
    fmt.println("Unlocking areas:")
    switch access_level {
        case 3:
            fmt.println("- Admin Control room")
            fallthrough //Moves to case 2
        case 2:
            fmt.println("- Server Room")
            fallthrough // Moves to case 1
        case 1:
            fmt.println("- Lobby")
        case:
            fmt.println("No access.")
    }

    event: any = "Hello event"
    switch v in event {
        case string:
            fmt.println("Recieved text event:", v)
        case int:
            fmt.println("Recieved numeric event:", v)
        case:
            fmt.println("Unknown event type.")
    }


}