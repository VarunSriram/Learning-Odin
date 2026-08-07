package main

import "core:fmt"

Network_State::enum {
    Online,
    Offline,
    Reconnecting,
    Timeout
}


main :: proc() {

    events := []any{"Player Joined", 42, "Base under attack!", 150}

    for event in events { 
        switch v in event {
            case string:
                fmt.println(v)
            case int:
                switch {
                    case v < 50:
                        fmt.println("Minor Damage")
                    case v >=50:
                        fmt.println("Heavy Damage!")
                }
            case:
        }
    }

    current_state := Network_State.Offline

    #partial switch current_state {
        case .Offline:
            fmt.println("Offline...")
        case .Reconnecting:
            fmt.println("Reconnecting...")
    }



}