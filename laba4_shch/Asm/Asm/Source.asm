.586 
.MODEL flat,C
.data
	i dd -1.0 ;Начальное значение i цикла
	iEnd dd 2.0 ;Конечное значение i цикла
	iStep dd 0.6 ;Шаг цикла
	Max dd -9999.0 ;Максимальное число

	
.code
	extern fun:near
	public FindMax

	FindMax proc C
		
		;Выгружаем из стека переданное функцией число(Шаг цикла)
		push ebp
		mov ebp,esp

		mov ecx, dword ptr [ebp+8]
		mov iStep,ecx

		for_start:
			;Проверка цикла, если i > iEnd выход из цикла
			fld i 
			fld iEnd
			fcomip st(0),st(1)	
			fstp st(0)
			jb for_end

			;Тело цикла:
			if_start:
				push ecx
			push dword ptr [i]
				push i
				call fun
				add esp,4
				fld Max

				;Если Max >= f(i), то fasle
				fcomip st(0),st(1)
				jae false

				;Иначе выполняется запись результата функции как максимального числа:
				fstp Max

			false:

			fstp st(0)
		

			;Прибавление к i шага цикла
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
