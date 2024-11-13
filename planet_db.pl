% Facts: planet(Name, Size, DistanceFromSun, NumberOfMoons)
planet('Mercury', 'Small', '57.91 million km', 0).
planet('Venus', 'Medium', '108.2 million km', 0).
planet('Earth', 'Medium', '149.6 million km', 1).
planet('Mars', 'Medium', '227.9 million km', 2).
planet('Jupiter', 'Large', '778.5 million km', 79).
planet('Saturn', 'Large', '1.429 billion km', 82).
planet('Uranus', 'Large', '2.871 billion km', 27).
planet('Neptune', 'Large', '4.495 billion km', 14).

% Facts: moon(MoonName, PlanetName)
moon('Moon', 'Earth').
moon('Phobos', 'Mars').
moon('Deimos', 'Mars').
moon('Io', 'Jupiter').
moon('Europa', 'Jupiter').
moon('Ganymede', 'Jupiter').
moon('Titan', 'Saturn').
moon('Rhea', 'Saturn').

% Query: Find the size, distance from sun, and moons of a given planet
planet_info(PlanetName, Size, DistanceFromSun, Moons) :-
    planet(PlanetName, Size, DistanceFromSun, NumberOfMoons),
    find_moons(PlanetName, Moons).

% Helper query to find all moons of a planet
find_moons(PlanetName, Moons) :-
    findall(Moon, moon(Moon, PlanetName), Moons).
