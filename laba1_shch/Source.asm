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
    mov bx, ax         ; Сохраняем X' в BX

    ; Циклический сдвиг вправо на 3 бита для Y
    mov ax, Y1         ; Загружаем Y в AX
    ror ax, 3          ; Циклический сдвиг вправо на 3 бита
    mov cx, ax         ; Сохраняем Y' в CX

    ; Циклический сдвиг вправо на 3 бита для Z
    mov ax, Z1         ; Загружаем Z в AX
    ror ax, 3          ; Циклический сдвиг вправо на 3 бита
    mov dx, ax         ; Сохраняем Z' в DX

    ; Вычисляем M = (X' * 3 + Y') OR Z'
    mov ax, bx         ; Загружаем X' в AX
    shl ax, 1          ; Умножаем на 2 (AX = X' * 2)
    add ax, bx         ; AX = X' * 2 + X' (AX = X' * 3)

    ; Проверка на переполнение
   

    add ax, cx         ; AX = (X' * 3) + Y'
    
    

    or ax, dx          ; AX = ((X' * 3) + Y') OR Z'
    mov M, ax          ; Сохраняем результат в M

    jmp exit            ; Переход к завершению программы



exit:
    invoke ExitProcess, 0 ; Завершение программы с кодом 0
End Start
