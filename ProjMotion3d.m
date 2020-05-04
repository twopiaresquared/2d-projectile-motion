 clear % this will help you clear the values from the previous run
 close 
 
 % Section 1
 %Initial display, this acts as a cannon operator enabling your to decide
 %the horizontal and vertical velocity
 Horz_Velocity = input('Awaiting your command Captain.Cannon is ready to fire!What would like the horizontal velocity to be,Captain?: ');            
 Vert_Velocity = input('And Vertical?:');  
 %since I chose measureents for the cannonbal from the civil war era I have
 %restricted the velocity to 50. Feel free to stretch it until the plot
 %turns from a curve to edges
 if Horz_Velocity > 50 || Vert_Velocity>50
     disp('Sorry sir, our civil war era cannons are not equipped for the mentioned velocities. Perhaps try less than 50, Captain?')
     Horz_Velocity = input('Cannon ready to fire, what you like the horizontal velocity to be,Captain?: ');            
     Vert_Velocity = input('And Vertical?:');
 end
 
 %Section 2
 %All of the initial information for our calculations islisted here.
  M = 5.4;%mass of a cannonball (kg) 
  Cr=4; %radius of the cannon ball (in)
  CAx= (pi*Cr^4)/4; %cross sectional area of x component of cannonball
  CAy= (pi*Cr^4)/4; %cross sectional area of y component of cannonball
  Ca=CAx+CAy; %x and y components added for total area
  A= Ca*0.00064516;% conversion from in^2 to m^2
  V = sqrt(Horz_Velocity^2 + Vert_Velocity^2);% Combines horizontal aand vertical velocities
  G = 9.8;% Acceleration due to Gravity(m/s^2)       
  Drag_coeff = 0.47;   %Drag coefficient        
  x = 0; %xi
  y = 0; %yi              
  xf = 0; %declaring xf variable for x final 
  yf=0;
  t = 0; %time
  dt = 0.05;%s set the intervals at which time will be evalutated
  Air_Density = 1.225;%Assuming we are at sea level(kg/m^3)
  rho=Air_Density;
  
  
  %Section 3
  %While loop calculates projectile motion iteratively
  i = 1;                  
    while min(y)> -0.05                                        
       t = t + dt;                                               
       i = i + 1;                                                
       xf(i) = xf(i-1)+ Horz_Velocity.*dt;                                  
       X_Drag = - ( rho*Drag_coeff*A/2 / M ) * V * Horz_Velocity;                            
       Y_Drag = -G - ( rho*Drag_coeff*A/2 / M ) * V * Vert_Velocity;                         
       Horz_Velocity_new = Horz_Velocity + X_Drag * dt;                                       
       Vert_Velocity_new = Vert_Velocity + Y_Drag * dt;                                       
       x(i) = x(i-1) + Horz_Velocity_new * dt + 0.5 * X_Drag * dt^2;               
       y(i) = y(i-1) + Vert_Velocity_new * dt + 0.5 * Y_Drag * dt^2;         
       Horz_Velocity = Horz_Velocity_new;
       Vert_Velocity = Vert_Velocity_new;
    end
    
 %Section 4
 %Plotting the projectile motion 
 plot(x,y,'b'), hold on;%blue-plots the Projectile Motion air resistance
 plot(xf,y,'r'), hold off;%red-plots the Projectile Motion air resistance             
 xlabel('Horizontal Distance (m)');    
 ylabel('Vertical Distance (m)');
 title('Cannonball paths with and without resistance'); 
 legend({'blue = without resistance','red = with resistance'},'Location','northeast')