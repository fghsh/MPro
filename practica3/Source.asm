.686
.model flat, stdcall

.stack 100h
.data
    X1 dw 100          ; �������� �������� X
    Y1 dw 21           ; �������� �������� Y
    Z1 dw 4            ; �������� �������� Z
    M  dw 0            ; ��������� M
    overflow_flag db 0 ; ���� ������������

.code
ExitProcess PROTO STDCALL :DWORD 

Start:

    ; ����������� ����� ������ �� 3 ���� ��� X
    mov ax, X1         ; ��������� X � AX
    ror ax, 3          ; ����������� ����� ������ �� 3 ����
    shl ax, 1          ; �������� �� 2 (AX = X' * 2)
    add ax, X1         ; AX = X' * 2 + X' (AX = X' * 3)

    
    mov bx, Y1         ; ��������� Y � BX
    ror bx, 3          ; ����������� ����� ������ �� 3 ����
    add ax, bx         ; AX = (X' * 3) + Y'

  
    mov dx, Z1         ; ��������� Z � DX
    ror dx, 3          ; ����������� ����� ������ �� 3 ����

    or ax, dx          ; AX = ((X' * 3) + Y') OR Z'
    mov M, ax          

    jmp exit            

exit:
    invoke ExitProcess, 0 ; ���������� ��������� � ����� 0
End Start
