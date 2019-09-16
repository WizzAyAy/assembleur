global main
extern printf

; ===== DATA SECTION =====
section .data

MAXI equ 20
tab times MAXI dd 0


; ===== CODE SECTION =====
section .text

calc_sum:

	push ebp		;entrée dans un sous prog
	mov ebp, esp
	
	mov ebx, [ebp+8]
	mov edx, [ebp+12]
	mov eax, 0
	mov ecx, 0
	
.for:

	cmp ecx, edx
	jge .endfor

		;sum + t[i]
		add eax, [ebx + ecx * 4]
		

	inc ecx
	jmp.for
	
.endfor:
	
	mov esp,ebp		;sortie dans un sous prog
	pop ebp
	ret
	
main:
	push ebp 	;entrée dabs le sous programme
	mov ebp,esp
	pushad		;sauvegarde tous les registres generaux

	MOV   ecx, 0	;variable pour le i
	MOV   eax, 0	;variable pour la somme
	MOV   ebx, 15   ;variable pour le n	

.for:
   
	CMP   eax, ebx
	JGE   .endfor
   	
   	;corps de la boucle
       		ADD   ecx, eax
       
	INC   eax         
	JMP   .for
	
.endfor:
	
	


	popad		;detruit tous les registres generaux
	
	xor eax,eax 	;return EXIT_SUCCESS
	
	mov esp,ebp	;sortie du sous prog
	pop ebp		;sortie du sous prog
	ret 		;sortie du sous prog

