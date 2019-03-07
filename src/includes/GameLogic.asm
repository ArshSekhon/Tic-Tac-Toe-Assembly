;Game_Loop:
;    call Print_Board
;
;    Call_Placement_Prompt_For_X:
;        call Placement_Prompt_For_X
;    
;    cmp eax, 0
;    jne Call_Placement_Prompt_For_X
;
;    call Print_Board
;
;    ; Prompt for placement for O 
;    Call_Placement_Prompt_For_O:
;        call Placement_Prompt_For_O
;    cmp eax, 0
;    jne Call_Placement_Prompt_For_O
;
;    
;    call Check_For_Win
;
;    jmp Game_Loop
;
;Game_Loop_Exit:
;    ret
;
;
;Check_For_Win:
;    nop
;    ret



; Row check

; Input EDX=number of row to check starting 0 
; Input ESI=Character to check for
Row_Check:
    ;loads the characeter into memory
    mov bl,byte[esi]
    mov ecx, 3
    
    Row_Check_Lo:
        imul edx, 3
        push ecx
        sub ecx,1
        add ecx, edx
        add ecx, board


        cmp byte[ecx], bl
        pop ecx
        jne Not_Match


        loop Row_Check_Lo

        
        mov ecx, placement_error_txt
        mov edx, placement_error_txt_len
        call Print

        jmp Exit

        Not_Match:
            ret 
    ; find the position on the board
    ;mov al,byte[esi]
    ;sub eax, 1  
    ;mov ecx, board
    ;add ecx, eax
;
    ;;   Check if the place is already occupied
    ;cmp byte[ecx], '9'
    ;jg Token_Placement_Error
;
    ;; Perform the placement
    ;mov [ecx], al
;
    ;mov eax, 0
    ;Placment_Attempt_Complete:
    ;ret

; Row 2 check
; Row 3 check

; Column 1 check
; Column 2 check
; Column 3 check


; Diagonal 1 check \
; Diagonal 2 check /