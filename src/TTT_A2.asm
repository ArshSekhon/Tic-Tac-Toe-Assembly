; data section
section .data
    ; user prompt
    player_name_prompt             db      "Enter name of player ", 0
    player_name_prompt_len              equ     $-player_name_prompt

    ; some symbols to be used
    colon                   db      ": "
    dash_symbol             db     "-"
    pipe_symbol             db     "|"
    x_symbol                db     "X"
    o_symbol                db     "O"
    one                     db    1


    vs_text                 db     " v/s "
    vs_text_len             equ     $-vs_text

; bss section
SECTION .bss     
    name_player_x              resb    256 
    name_player_x_len          resb    10
    name_player_o              resb    256
    name_player_o_len          resb    10 

    read_len                resb    10

SECTION .text
global      _start
    

_start:
    call Prompt_Name_Player_X
    call Prompt_Name_Player_O
    call Print_Name_Player_X
    call Print_Name_Player_O    
    jmp Exit



; Input: none
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
; Output: Print name of user X
Print_Name_Player_X:
    mov ecx, name_player_x
    mov edx, [name_player_x_len]
    sub edx, 1                  ; to remove newline
    call Print
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

; Input: none
; Output: Print name of user O
Print_Name_Player_O:
    mov ecx, name_player_o
    mov edx, [name_player_o_len]
    sub edx, 1                  ; to remove newline
    call Print
    ret

; Input:
;   ecx=memory reference to the text
;   edx=length of the text to Print
; Output:
;   Prints the text to the screen
Print:
    mov     eax, 4          ;syswrite
    mov     ebx, 1          ;stdout 1 | stderr 3
    int     80H 
    ret

; Input:
;   ecx = input buffer
; Output:
;   string read into the buffer referenced by ecx
;   eax = length of the string read
Read_Input:
    mov     eax, 3          ;sysread
    mov     ebx, 0          ;stdin
    mov     edx, 50
    int     80H
    mov     [read_len], eax
    ret 


Exit:  
    mov     eax, 1          ;sysexit
    xor     ebx, ebx
    int     80H
