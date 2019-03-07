; Output: none
; Prompts user and Reads the name of user X from the keyboard
Prompt_Name_Player_X:
    ;Prints the prompt for name for X
    mov ecx, player_name_prompt
    mov edx, player_name_prompt_len
    call Print

    mov ecx, x_symbol
    mov edx, 1
    call Print

    mov ecx, colon
    mov edx, 2
    call Print 

    ; read input from the keyboard
    mov ecx, name_player_x 
    call Read_Input
    mov  eax, [read_len]
    mov  [name_player_x_len], eax  ; restore the length
    ret


; Input: none
; Output: none
; Prompts user and Reads the name of user O from the keyboard
Prompt_Name_Player_O:
    mov ecx, player_name_prompt
    mov edx, player_name_prompt_len
    call Print

    mov ecx, o_symbol
    mov edx, 1
    call Print

    mov ecx, colon
    mov edx, 2
    call Print 

    ; read input from the keyboard
    mov ecx, name_player_o 
    call Read_Input
    mov  eax, [read_len]
    mov  [name_player_o_len], eax  ; restore the length
    ret

Placement_Prompt_For_X:
    call Print_Name_Player_X
    call Generic_Placement_Prompt

    ; make placement
    mov esi, placement_input 
    call Read_Int_In_First_Char ; convert the user input to integer to pass in into the Place_Token via EAX

    ; make placement

    mov esi, x_symbol
    call Place_Token 

    ret
    
Placement_Prompt_For_O:
    call Print_Name_Player_O
    call Generic_Placement_Prompt

    mov esi, placement_input 
    call Read_Int_In_First_Char ; convert the user input to integer to pass in into the Place_Token via EAX

    ; make placement

    mov esi, o_symbol
    call Place_Token

    ret
    
Generic_Placement_Prompt:
    mov ecx, turn_prompt_text
    mov edx, turn_prompt_text_len
    call Print
 
    ; read input from the keyboard
    mov ecx, placement_input 
    call Read_Input
    mov  eax, [read_len]
    mov  [placement_input_len], eax  ; restore the length
    ret
