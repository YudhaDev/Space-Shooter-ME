RSRC                 	   Resource            ��������   DialogueData                                             	      resource_local_to_scene    resource_name    script    starts    nodes 
   variables 	   comments    strays    characters       Script 4   res://addons/dialogue_nodes/objects/DialogueData.gd ��������      local://Resource_0e65b s      	   Resource                                START ,      0_1                0_1             link ,      1_1       offset 
              	   start_id       START       1_1          	   dialogue    t   Writing the character name for every single dialogue can be tedious and prone to mistakes.
(I mean look at my name)       offset 
     \C          options                       
   condition              link ,      1_2       text              size 
     �C  �C      speaker       Gerfg       1_2          	   dialogue    s   So you can create CharacterList resources containing an array of Character resources and use it in your dialogues.       offset 
     D          options                       
   condition              link ,      1_3       text              size 
     �C ��C      speaker              1_3          	   dialogue    J   What's more you can even put character profiles to spice up the dialogue.       offset 
     aD          options                       
   condition              link       END       text              size 
     �C ��C      speaker                                              res://examples/Characters.tres RSRC