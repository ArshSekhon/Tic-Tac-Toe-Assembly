; data section
section .data
    ; user prompt
    player_name_prompt             db      "Enter name of player ", 0
    player_name_prompt_len              equ     $-player_name_prompt

    ; some symbols to be used
    colon                   db      ": "
    underscore_symbol       db     "_"
    pipe_symbol             db     "|"

    x_symbol                db     "X"
    o_symbol                db     "O"

    space                   db     " "

    x_symbol_braced         db     " (X)"
    x_symbol_braced_len     equ    $-x_symbol_braced

    o_symbol_braced         db     " (O)"
    o_symbol_braced_len     equ    $-o_symbol_braced

    
    turn_prompt_text       db     "'s turn: Please enter the position to place your sign (1-9): "
    turn_prompt_text_len   equ    $-turn_prompt_text

    winner_dec_text       db     ", Congratulations! You are the WINNER !!! ",0xA, 0xD,0xA, 0xD
    winner_dec_text_len   equ    $-winner_dec_text


    vs_text                 db     " v/s "
    vs_text_len             equ     $-vs_text
    
    new_line_token          db      0xA, 0xD
    new_line_token_len      equ     $-new_line_token


    placement_error_txt         db      "Cannot Place a marker at this position, Try Again!",0xA, 0xD
    placement_error_txt_len     equ     $-placement_error_txt

    ;o_board_sign            db      1
    ;x_board_sign            db      2

    ; pointer to the Tic-Tac-Toe Board
    
    board                   db      "1","2","3",\
                                    "4","5","6",\
                                    "7","8","9"

    test_txt                db      "123"

; bss section
SECTION .bss     
    name_player_x              resb    256 
    name_player_x_len          resb    4
    name_player_o              resb    256
    name_player_o_len          resb    4 

    placement_input            resb     10
    placement_input_len        resb     4

    read_len                resb    10

SECTION .text
global      _start
    

_start:
    call Prompt_Name_Player_X
    call Prompt_Name_Player_O
    ;call Game_Loop
     call Declare_Win_Player_X_And_Exit
    ;call Print_Game_Header 
    
    ;call Print_Board 

    jmp Exit


%include './includes/GameLogic.asm' 
%include './includes/Board.asm' 
%include './includes/Prompts.asm'  
%include './includes/Prints.asm'    
%include './includes/BasicIO.asm' 
%include './includes/Utils.asm'

Exit:  
    mov     eax, 1          ;sysexit
    xor     ebx, ebx
    int     80H
