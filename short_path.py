grid= [
    [4,2,7,3],
    [6,5,9,1],
    [8,4,3,6],
    [7,2,5,4]
]
dp= grid

for i in range(0,4):
    for j in range(0,4):
        if(i==0 and j==0):
            continue
        elif(i==0):
            dp[i][j]+=dp[i][j-1]
        elif(j==0):
            dp[i][j]+=dp[i-1][j]


for i in range(1,4):
    for j in range(1,4):
        dp[i][j]=grid[i][j]+ min(dp[i-1][j],dp[i][j-1])

for i in range(0, 4):
    for j in range(0, 4):
        print(f"{dp[i][j]}\t", end='')
    print() 

print("\nSHORTEST PATH  FROM START TO END IS ",dp[3][3])