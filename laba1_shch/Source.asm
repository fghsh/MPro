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
    mov bx, ax         ; ��������� X' � BX

    ; ����������� ����� ������ �� 3 ���� ��� Y
    mov ax, Y1         ; ��������� Y � AX
    ror ax, 3          ; ����������� ����� ������ �� 3 ����
    mov cx, ax         ; ��������� Y' � CX

    ; ����������� ����� ������ �� 3 ���� ��� Z
    mov ax, Z1         ; ��������� Z � AX
    ror ax, 3          ; ����������� ����� ������ �� 3 ����
    mov dx, ax         ; ��������� Z' � DX

    ; ��������� M = (X' * 3 + Y') OR Z'
    mov ax, bx         ; ��������� X' � AX
    shl ax, 1          ; �������� �� 2 (AX = X' * 2)
    add ax, bx         ; AX = X' * 2 + X' (AX = X' * 3)

    ; �������� �� ������������
   

    add ax, cx         ; AX = (X' * 3) + Y'
    
    

    or ax, dx          ; AX = ((X' * 3) + Y') OR Z'
    mov M, ax          ; ��������� ��������� � M

    jmp exit            ; ������� � ���������� ���������



exit:
    invoke ExitProcess, 0 ; ���������� ��������� � ����� 0
End Start
