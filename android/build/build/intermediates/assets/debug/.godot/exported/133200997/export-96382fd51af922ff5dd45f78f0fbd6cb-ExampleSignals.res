RSRC                 	   Resource            ��������   DialogueData                                             	      resource_local_to_scene    resource_name    script    starts    nodes 
   variables 	   comments    strays    characters       Script 4   res://addons/dialogue_nodes/objects/DialogueData.gd ��������      local://Resource_1a22k s      	   Resource                                START ,      0_1                0_1             link ,      1_1       offset 
              	   start_id       START       1_1          	   dialogue    x   You can trigger a signal from your dialogue.
Additionally you can pass a value with the signal and use it in your code.       offset 
     \C          options                       
   condition              link ,      3_1       text       Try it!                
   condition              link       END       text       Got it, bye!       size 
   `��C ��C      speaker       Greg       1_2          	   dialogue    B   The signal triggered the code in the demo to create an explosion.       offset 
     HD          options                       
   condition              link ,      3_1       text       Do it again!                
   condition              link       END       text       Got it!       size 
     �C ��C      speaker       Greg       3_1             link ,      1_2       offset 
     D          signalValue       explode                                         RSRC