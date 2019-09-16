global main
extern printf

; ===== DATA SECTION =====
section .data



msg_som db "votre somme est egale a %d", 10, 0


; ===== CODE SECTION =====
section .text

main:
	push ebp 	;entrée dabs le sous programme
	mov ebp,esp
	pushad		;sauvegarde tous les registres generaux

	MOV   EAX, 0	;variable pour le i
	MOV   ECX, 0	;variable pour la somme
	MOV   EBX, 15   ;variable pour le n	

.for:
   
	CMP   EAX, EBX
	JGE   .endfor
   	
   	;corps de la boucle
       		ADD   ECX, EAX
       
	INC   EAX         
	JMP   .for
	
.endfor:
	
	push EBX
	push dword msg_som	;on push le msg_som
	call printf		
	add esp, 8


	popad		;detruit tous les registres generaux
	
	xor eax,eax 	;return EXIT_SUCCESS
	
	mov esp,ebp	;sortie du sous prog
	pop ebp		;sortie du sous prog
	ret 		;sortie du sous prog

