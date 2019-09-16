global main
extern printf
extern scanf

; ===== DATA SECTION =====
section .data
	
	x dd 1 ; x est un entier sur 32 bits
	y dd 20 ; y est un entier sur 32 bits
	
	msg_inf 	db "%d inferieur a %d", 10, 0
	msg_sup_egal 	db "%d superieur ou egal a %d", 10, 0
	
	saisir_x db "saisir x : ", 0
	saisir_y db "saisir y : ", 0
	msg_scanf db "%d", 0 ;%d lit un entier signé
	
	;nasm -f elf -g -F dwarf tp1_1_nasm.asm
	;gcc -o tp1_1_nasm.exe tp1_1_nasm.o -m32
	;./tp1_1_nasm.exe 

; ===== CODE SECTION =====
section .text

main:
	push ebp 	;entrée dabs le sous programme
	mov ebp,esp
	pushad		;sauvegarde tous les registres generaux
	
	;printf saisir x;
	push dword saisir_x
	call printf
	add esp, 4
	
	;scanf ("%d", &x);
	push dword x
	push dword msg_scanf
	call scanf
	add esp,8
	
	;prinft saisir y;
	push dword saisir_y
	call printf
	add esp, 4
	
	;scanf ("%d", &y);
	push dword y
	push dword msg_scanf
	call scanf
	add esp,8

.if:	
	mov eax, [x]	;charge dans eax x
	mov ebx, [y]
	cmp eax, ebx	;instruction pour comp > < = ?
	jge .else	;jump au else d'abord !
			;si x >= y alors on va 
.then:
	;code du then
	
	;printf("%d inferieur a %d\n, x ,y");
	push dword [y]		;push ebx
	push dword [x]		;push eax
	push dword msg_inf	;on push le msg_inf
	call printf		
	add esp, 12
	
	jmp .endif
.else:	
	;code du else
	
	;printf("%d superieur ou egal a %d\n, x, y");
	
	push dword [x]		;push ebx
	push dword [y]		;push eax
	push dword msg_sup_egal	;on push le msg_sup_egal
	call printf		
	add esp, 12
	


.endif:	
	
	popad		;detruit tous les registres generaux
	
	xor eax,eax 	;return EXIT_SUCCESS
	
	mov esp,ebp	;sortie du sous prog
	pop ebp		;sortie du sous prog
	ret 		;sortie du sous prog


