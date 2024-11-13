def water_jug_problem(max_a, max_b, target):
    jug_a = 0  
    jug_b = 0  

    steps = [] 

    while jug_a != target:
        if jug_a < max_a:  
            jug_a = max_a
            steps.append((jug_a, jug_b))

        if jug_a > 0 and jug_b < max_b:
            pour_amount = min(jug_a, max_b - jug_b)  
            jug_a -= pour_amount  
            jug_b += pour_amount  
            steps.append((jug_a, jug_b))

        if jug_b == max_b:
            jug_b = 0
            steps.append((jug_a, jug_b))

        if jug_a == target:
            break 

        if jug_a > 0 and jug_b == 0:
            jug_b = jug_a
            jug_a = 0
            steps.append((jug_a, jug_b))

    print(f"Steps to achieve exactly {target} gallons in the {max_a}-gallon jug:")
    for step in steps:
        print(step)

water_jug_problem(4, 3, 2)  
water_jug_problem(5, 2, 1)  

