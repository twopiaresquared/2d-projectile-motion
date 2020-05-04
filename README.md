# 2d-projectile-motion
Final project for my Matlab class. Extremely basic implementation of 2d projectile motion with air resistance.


Algorithm:
2) Initialize all the variables listed above.
3) While y is greater than - Δt
a) Increment t with Δt
b) Increase i (iteration-initialized at 1)
c) Calculate x position as it changes with time Δx = vxΔt + 1/2 axΔt2
d) Calculate drag for the x component given by − Dx = ((⍴CA)/M).V .V x
e) Calculate drag for the x component given by − Dy =− G − ((⍴CA)/M).V .V y
(since G acts in opposite y-direction
f) Increment Vx w.r.t Dx and Δt
g) Increment Vy w.r.t Dy and Δt
h) Calculate x + Δx = x + vx + 1/2(axΔt2)
i) Calculate y + Δy = y + vy + 1/2(ayΔt2)
j) Allocate the calculations to Vx and Vy respectively
Time Complexity: The Algorithm runs in O(n) time.
