  .data 0x10000000

num1: .word 0x11112222
      .word 0x88884444
      .word 0
      .half 0x1234
      .half 0x4321
      .byte -8
      .byte 123
     
     .data 0x10000020 #dirección para evitar errores
nom: .asciiz "ALEJANDRO REYES ALBILLAR"
     .align 2
      
  .text
     
main:
	la $7,0x10000000
	lw $8,0($7)
	lw $9,4($7)
	lw $10,8($7)
	move $11,$8
	lh $12,8($7)
	lb $13,8($7)
	sw $11,16($7)
	add $14,$11,$12
	add $15,$9,$11
	sub $16,$10,$11
	sub $17,$12,$11
	divu $8,$12
	mult $8,$13
	mfhi $18
	xor $19,$10,$11
	sll $19,$19,4

bucle:
	beqz $18,fin
	add $13,$13,$13
	addi $18,$18,-1
	j bucle
     
fin: li $v0, 4 # imprimir cadena
     la $a0, nom #direccion de la cadena
     syscall	#llamada al sistema
     li $v0, 10 # Fin programa
     syscall
     