RSRC                 	   Resource            ��������   DialogueData                                             	      resource_local_to_scene    resource_name    script    starts    nodes 
   variables 	   comments    strays    characters       Script 4   res://addons/dialogue_nodes/objects/DialogueData.gd ��������      local://Resource_0sh3l s      	   Resource                                START ,      0_1                0_1             link ,      1_1       offset 
              	   start_id       START       1_1          	   dialogue    Y   You can store and use variables from your dialogue tree.
Like: You have {{COINS}} coins!       offset 
     \C          options                       
   condition              link ,      1_2       text              size 
     �C  qC      speaker       Greg       1_2          	   dialogue       What would you like to try?       offset 
     /D          options                       
   condition              link ,      1_3       text    
   Set value                
   condition              link ,      1_6       text       Check condition                
   condition              link       END       text       Nothing       size 
     �C ��C      speaker       Greg       1_3          	   dialogue    .   Setting COINS to 5.
Current value: {{COINS}}
       offset 
     �D          options                       
   condition              link ,      4_1       text              size 
     �C  qC      speaker       Greg       1_4          	   dialogue       New value: {{COINS}}       offset 
    ��D          options                       
   condition              link ,      1_5       text              size 
     �C  qC      speaker       Greg       1_5          	   dialogue    H   You can even use the set node perform arithematic operations on values.       offset 
     �D          options                       
   condition              link ,      1_2       text       Got it!                
   condition              link       END       text       Bye       size 
     �C  �C      speaker       Greg       1_6          	   dialogue    G   You can use the condition node to show dialogues based on a condition.       offset 
     �D  �C      options                       
   condition              link ,      5_1       text              size 
     �C  qC      speaker       Greg       1_7          	   dialogue    +   Like right now you have more than 5 coins!       offset 
     �D  �C      options                       
   condition              link ,      1_9       text              size 
     �CB qC      speaker       Greg       1_8          	   dialogue    /   I can tell you don't have more than 5 coins...       offset 
     �D   D      options                       
   condition              link ,      1_9       text              size 
     �C  qC      speaker       Greg       1_9          	   dialogue    G   Feel free to look at the example files to learn how to do it yourself!       offset 
     E  D      options                       
   condition              link ,      1_2       text       Got it!                
   condition              link       END       text       Bye       size 
     �C  �C      speaker       Greg       4_1             link ,      1_4       offset 
     �D  C      type              value       5    	   variable       COINS       5_1             false ,      1_8       offset 
     �D  �C   	   operator             true ,      1_7       value1    
   {{COINS}}       value2       5                COINS             type             value       A                              RSRC