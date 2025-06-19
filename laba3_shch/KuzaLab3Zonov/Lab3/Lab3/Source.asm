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

fld lines[0 *4] ;Загрузка стороны a
fld lines[1 *4] ;Загрузка стороны b
fld lines[2 *4] ;Загрузка стороны c
fadd ;Сложение сторон
fadd

fld p 
fdiv ;Деление суммы на 2
fst p ;Нашли число p - полупериметр

fld lines[0 *4]
fsub ;(p-a)

fld p
fld lines[1 *4]
fsub ;(p-b)

fld p
fld lines[2 *4]
fsub ;(p-d)
;Теперь в стеке загружены результаты разностей полупериметра с сторонами

fld p
fmul
fmul
fmul ;p*(p-a)*(p-b)*(p-c)

fsqrt ;извлечение корня

fst s ;запишем результат в s

exit:
Invoke ExitProcess,1
End Start