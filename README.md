# Sparus AUV Modeling and Simulation

## Introduction
Sparus autonomous underwater vehicle, developed by IQUA Robotics in Girona, Spain, is used in a wide range of underwater operations. The project focus on the dynamic modeling and simulation of the Sparus vehicle by taking into consideration the stiffness, added mass, and damping effects. In addition, the dynamic model behavior in different underwater scenarios will be analyzed with the help of MATLAB & SIMULINK simulations.

The Sparus AUV is represented in the figure below. We consider the origin of the base "body" in the gravity center of the Sparus. It is placed at the x-position of the central thruster and at the middle of the cylinder.

<div align="center">
<img src = "sparus_auv_image.png" width="100%">
<p>Sparus AUV</p>
</div>


## Project Workflow
1. **Compute Dimensions**  
   - Using the AUV picture and the known full-body length, computing all other dimensions of the different bodies.

2. **Analyze the Global Mass Matrix**  
   - Explaining all the terms in the global real mass matrix and identifying the origin of each term.

3. **Compute Added Mass Matrices**  
   - Compute each added mass matrix at the buoyancy center of the Sparus.
   - Except for the main body, the center of gravity (CG) and center of buoyancy (CB) of other bodies coincide.

4. **Compare Added Mass Matrices**  
   - Compare the matrix at CG and CO.
   - Discuss whether the distance between these two points is significant.

5. **Analyze Mass Contributions**  
   - Compare the values of the main solid with the other bodies and conclude.

6. **Compare Added and Real Mass Matrices**  
   - Identify differences and conclude on their significance.

7. **Estimate Drag Matrices**  
   - Compute all drag matrices.

8. **Validate the Simulator**  
   - Conduct simple experiments to verify the model accuracy.

9. **Simulate Mass Matrix Impact**  
   - Run simulations to highlight the effect of different coefficients in the global mass matrix by imposing linear accelerations.

10. **Simulate Drag Force Impact**  
   - Run simulations to observe the effect of drag forces on different bodies by imposing constant linear speed.
