.686
.model flat,stdcall
.stack 100h
.data

lines dd 10.5, 15.1, 10.5

p dd 2.0

s dd ?

.code
ExitProcess PROTO STDCALL :DWORD
Start:

fld lines[0 *4] ;�������� ������� a
fld lines[1 *4] ;�������� ������� b
fld lines[2 *4] ;�������� ������� c
fadd ;�������� ������
fadd

fld p 
fdiv ;������� ����� �� 2
fst p ;����� ����� p - ������������

fld lines[0 *4]
fsub ;(p-a)

fld p
fld lines[1 *4]
fsub ;(p-b)

fld p
fld lines[2 *4]
fsub ;(p-d)
;������ � ����� ��������� ���������� ��������� ������������� � ���������

fld p
fmul
fmul
fmul ;p*(p-a)*(p-b)*(p-c)

fsqrt ;���������� �����

fst s ;������� ��������� � s

exit:
Invoke ExitProcess,1
End Start