environment = {
    "A": "Dirty",
    "B": "Dirty",
    "C": "Dirty",
    "D": "Clean",
    "E": "Dirty"
}

rooms = list(environment.keys())

vacuum_position = rooms[0]

def vacuum_cleaner(environment, rooms):
    steps = 0  
    current_position_index = 0 
    
    while "Dirty" in environment.values():
        vacuum_position = rooms[current_position_index]
        print(f"Step {steps + 1}:")
        print(f"Vacuum is in room {vacuum_position}. Room status: {environment}")
        
        if environment[vacuum_position] == "Dirty":
            environment[vacuum_position] = "Clean"
            print(f"Room {vacuum_position} is dirty. Cleaning...")
        
        current_position_index = (current_position_index + 1) % len(rooms)
        steps += 1
        print(f"Moving to room {rooms[current_position_index]}.\n")
    
    print("All rooms are clean!")
    print(f"Total steps taken: {steps}")

vacuum_cleaner(environment, rooms)
