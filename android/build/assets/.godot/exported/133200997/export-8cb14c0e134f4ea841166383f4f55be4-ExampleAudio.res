RSRC                 	   Resource            ��������   DialogueData                                             	      resource_local_to_scene    resource_name    script    starts    nodes 
   variables 	   comments    strays    characters       Script 4   res://addons/dialogue_nodes/objects/DialogueData.gd ��������      local://Resource_5ac7n s      	   Resource                                START ,      0_1                0_1             link ,      1_1       offset 
              	   start_id       START       1_1          	   dialogue       Oh hey!       offset 
     \C          options                       
   condition              link ,      1_2       text              size 
     �C  kC      speaker             1_2          	   dialogue    K   This is an example of setting up audio to play when a dialogue is playing.       offset 
     D          options                       
   condition              link ,      1_3       text              size 
     �C  kC      speaker             1_3          	   dialogue    �   [wait]Funny thing is, you don't have to do anything in the dialogue editor.[/wait]
[wait time=1]Its just the signal connected in the scene's script[/wait]       offset 
     aD          options                       
   condition              link ,      1_4       text              size 
     �C  qC      speaker             1_4          	   dialogue    �   [wait speed=4]Also...[/wait][wait time=2] you can mess around with the wait speed and time and the sound plays accordingly![/wait]       offset 
     �D          options                       
   condition              link       END       text              size 
     �C  qC      speaker                                              res://examples/Characters.tres RSRC