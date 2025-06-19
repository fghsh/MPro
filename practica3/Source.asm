.686
.model flat, stdcall

.stack 100h
.data
    X1 dw 100          ; Исходное значение X
    Y1 dw 21           ; Исходное значение Y
    Z1 dw 4            ; Исходное значение Z
    M  dw 0            ; Результат M
    overflow_flag db 0 ; Флаг переполнения

.code
ExitProcess PROTO STDCALL :DWORD 

Start:

    ; Циклический сдвиг вправо на 3 бита для X
    mov ax, X1         ; Загружаем X в AX
    ror ax, 3          ; Циклический сдвиг вправо на 3 бита
    shl ax, 1          ; Умножаем на 2 (AX = X' * 2)
    add ax, X1         ; AX = X' * 2 + X' (AX = X' * 3)

    
    mov bx, Y1         ; Загружаем Y в BX
    ror bx, 3          ; Циклический сдвиг вправо на 3 бита
    add ax, bx         ; AX = (X' * 3) + Y'

  
    mov dx, Z1         ; Загружаем Z в DX
    ror dx, 3          ; Циклический сдвиг вправо на 3 бита

    or ax, dx          ; AX = ((X' * 3) + Y') OR Z'
    mov M, ax          

    jmp exit            

exit:
    invoke ExitProcess, 0 ; Завершение программы с кодом 0
End Start
