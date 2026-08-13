# Simulink Mechatronics System

MATLAB/Simulink implementation of mechatronics system with DC motor, gear train, and six-bar/Watt linkage simulation and analysis which is commonly used in Automotive Suspensions.

## Repository contents

### Modules

Each main module was tested and verified independently before integration into the final system model. Modules also contain submodules to keep the design organised

#### Motor

`motor.slx` implements the DC motor and H-bridge subsystem.

![DC Motor Simulink model](Screenshots/dc-motor-pwm-controlled-h-bridge-simulink.png)

#### Gear train

`Geartrain.slx` implements the 10:1 gear train model.

![Gear train Simulink model](Screenshots/gear-train-simulink.png)

![Gear train side view](Screenshots/gear-train-side%2010%3A1.png)

#### Six-bar (Watt) linkage

`six_bar_linkage.slx` implements the six-bar linkage model.

![Watt six-bar linkage Simulink model](Screenshots/watts-6-bar-linkage-simulink.png)

![Six-bar linkage extended up](Screenshots/6-bar-linkage-extended-up.png)

#### Integrated system

`Design_Project.slx` integrates the motor, gear train, and linkage modules.

![Full system schematic](Screenshots/full-system-schematic.png)

![Integrated system fully extended down](Screenshots/system-fully-extended-down.png)

The project `report.pdf` details the design choices and supporting theory.

### Requirements

- MATLAB with Simulink (models include files saved for R2022a compatibility).
- Simscape and the relevant Simscape mechanical/electrical add-ons, if prompted when opening a model.
