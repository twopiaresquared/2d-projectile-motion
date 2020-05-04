# 2d-projectile-motion
Final project for my Matlab class. Extremely basic implementation of 2d projectile motion with air resistance.


Problem:
The goal is to simulate a cannonball’s projectile motion and how air drag can affect it. In my
code I have plot two paths one without any air drag and another one with air drag.
Literature:
The first obvious step was to think about projectile motion without air drag. Without
accounting for the drag the only forces acting on the projectile were w=mg and the
components of acceleration were simply ax=0 and ay=-g.
The drag force acts both in the opposite direction to the projectile and in the direction
perpendicular to it. There were are going to consider +x-axis for horizontal and +y-axis for
vertical components.
We get the first equation for drag force from Newton’s Law’s
f = Dv2 where v2 = vx2 + vy2
F being a vector the equation for x and y-axis would be
f =− DV V x and f =− DV V y
The constant D can be given by:
D = (⍴CA)/2
Where ⍴ is the density of air and C is the drag coefficient of that object dependant on its
shape
Now if we want to calculate drag for both x and v components while taking into account the
velocity it will be given as follows:
a) − Dx = ((⍴CA)/M).V .V x (negative sign indicates that drag acts in opposite
direction.
b) − Dy =− G − ((⍴CA)/M).V .V y (-G means acceleration due to gravity acts in the
direction opposite to y)
Basic Equations:
The basic idea of the numerical calculations is as follows:

The acceleration components ax and ay are constantly changing as the velocity changes
over Δt. During the course of Δt acceleration becomes a=Δv/Δt
So we can have the following equations for Δv for both its x and y components.
vx + Δv = vx + axΔt for x components
vy + Δv = vy + ayΔt for y components
While this happens the co-ordinates are actually moving.
Therefore we can have the following equation for x-velocity.
Δx = (vx + Δv/2)/Δt = vxΔt + 1/2 axΔt2
Therefore the coordinates for both x and y components are:
x + Δx = x + vx + 1/2(axΔt2)
y + Δy = y + vy + 1/2(ayΔt2)
Plan and Algorithm:
The implement this simulation I have to consider some base conditions for the cannonball.
For the sake of reference I have used the cannonball measurements of the civil war
era(more on this later).
Definitions, variables, and calculations:
Initial Conditions:
m= mass of the object(kg)
All the civil war era cannonballs weighed 5.4kg with a radius of 4 inches
A=cross sectional area of the cannonball
Calulation:
Cr=4; %radius of the cannonball (in)
CAx= (pi*Cr^4)/4; %cross sectional area of x component of cannonball
CAy= (pi*Cr^4)/4; %cross sectional area of y component of cannonball
Ca=CAx+CAy; %x and y components added for total area
A= Ca*0.00064516; % conversion from in^2 to m^2
V= combination of Vx and Vy components of velocities. Comes from the equation v2 =
vx2 + vy2 (listed above)
G= acceleration due to gravity(m/s^2)
D= Drag coefficient of the cannonball
x= initial x position
y= initial y position
xf= final x position
yf=final y position
Rane 3
t= initial time
dt= Δt (I have set this at 0.5s, it can be changed)
Air_Density= air density at sea level.
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
Input:
This is the part where the role of the cannon operator comes in. The cannon operator can
choose the horizontal velocity and vertical velocity i.e Vx and Vy
This is given in the beginning of the code:
Vx = input( 'Awaiting your command Captain.Cannon is ready to fire!What would like the
horizontal velocity to be,Captain?: ' );
Vy = input( 'And Vertical?:' );
At this point I have restricted the ceiling for velocities to 50 since I realized the path descent
starts to straighten beyond this point. Feel free to comment on them if statement and
increase the velocity.
Output:
The output of the code is a 2d plot that traces the paths of the cannonball. Blue path is the
one with air resistance and red is the one without air resistance.
Implementation:
plot(x,y, 'b' ), hold on ; %blue-plots the Projectile Motion with air resistance

plot(xf,y, 'r' ), hold off ; %red-plots the Projectile Motion without air resistance
xlabel( 'Horizontal Distance (m)' );
ylabel( 'Vertical Distance (m)' );
title( 'Cannonball paths with and without resistance' );
legend({ 'blue = with resistance' , 'red = without resistance' }, 'Location' , 'northeast' )
