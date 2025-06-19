.586 
.MODEL flat,C
.data
	i dd -1.0 ;��������� �������� i �����
	iEnd dd 2.0 ;�������� �������� i �����
	iStep dd 0.6 ;��� �����
	Max dd -9999.0 ;������������ �����

	
.code
	extern fun:near
	public FindMax

	FindMax proc C
		
		;��������� �� ����� ���������� �������� �����(��� �����)
		push ebp
		mov ebp,esp

		mov ecx, dword ptr [ebp+8]
		mov iStep,ecx

		for_start:
			;�������� �����, ���� i > iEnd ����� �� �����
			fld i 
			fld iEnd
			fcomip st(0),st(1)	
			fstp st(0)
			jb for_end

			;���� �����:
			if_start:
				push ecx
			push dword ptr [i]
				push i
				call fun
				add esp,4
				fld Max

				;���� Max >= f(i), �� fasle
				fcomip st(0),st(1)
				jae false

				;����� ����������� ������ ���������� ������� ��� ������������� �����:
				fstp Max

			false:

			fstp st(0)
		

			;����������� � i ���� �����
			fld i
			fld iStep 
			fadd st(0),st(1)
			fstp i
			fstp st(0)

			jmp for_start
			
		for_end:
		fld Max;
		mov esp,ebp
		pop ebp
		ret
	FindMax endp
End
