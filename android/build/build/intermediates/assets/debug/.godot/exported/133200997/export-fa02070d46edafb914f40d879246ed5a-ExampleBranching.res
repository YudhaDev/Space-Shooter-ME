RSRC                 	   Resource            ��������   DialogueData                                             	      resource_local_to_scene    resource_name    script    starts    nodes 
   variables 	   comments    strays    characters       Script 4   res://addons/dialogue_nodes/objects/DialogueData.gd ��������      local://Resource_2tp50 s      	   Resource                                START ,      0_1       START2 ,      0_2       	         0_1             link ,      1_1       offset 
              	   start_id       START       0_2             link ,      1_4       offset 
         D   	   start_id       START2       1_1          	   dialogue       Which pill will you take?       offset 
     \C          options                       
   condition              link ,      1_2       text    	   Red pill                
   condition              link ,      1_3       text    
   Blue pill       size 
     �C ��C      speaker    	   Morpheus       1_2          	   dialogue    4   Do you have the doctor's prescription for the pill?       offset 
     D  ��      options                       
   condition              link       END       text       Uh...       size 
     �C @�C      speaker    	   Morpheus       1_3          	   dialogue    3   You shouldn't take pills from strangers, you know!       offset 
     D  �C      options                       
   condition              link       END       text       Oh...       size 
     �C @�C      speaker    	   Morpheus       1_4          	   dialogue    t   Heck, you can even make multiple dialogue trees in the same file! (Say, all dialogues for one character or one act)       offset 
     \C  D      options                       
   condition              link ,      1_5       text              size 
     �C @�C      speaker       Greg       1_5          	   dialogue    �   When you want to call a specific dialogue tree, just pass the unique start ID when calling [color=green]$DialogueBox.start('MyID')[/color]       offset 
     D  D      options                       
   condition              link       END       text       Cool!       size 
     �C @�C      speaker       Greg       2_1             comment    4   Create branching dialogues using different options.       offset 
     ��  �B      size             x      LC      y      mC      2_2             comment    1   Create multiple dialogue trees in the same file.       offset 
     ��  *D      size             x      LC      y      mC                         2_1       2_2                     RSRC