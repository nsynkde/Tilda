# VL.Automata
A set of VL nodes to create and run state machines

## Installation
Clone the repo and reference VL.Automata.vl

## Creating a state machine
Create the node BigAutomataEditor, set a path where the resulting description should be saved to and start creating states with right click. Once staisfied press Ctrl+S to save to the specified path.

## Running a state machine
Create the node Automata and set the path to the state machine description file. As of now when creating the node it will crash immediately because it can't deal with empty paths. So once the proper path is set press F8/F5 to restart the running program.

## Demo
Open examples/AutomataWithEditor.vl and press Ctrl+R in render window to see the editor and the automata node in action. 
