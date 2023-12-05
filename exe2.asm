.data
 	inicio: .asciiz "De um numero natural "
 	fim: .asciiz "o numero harmonico é "
 	zero: .float 0.0
.text
	main:
		li $v0, 4 #leitura de string
		la $a0, inicio
		syscall
		
		li $v0, 5 #le inteiro
		syscall
		
		move $t0, $v0 #seta inteiro
		li $t1, 1
		
		mtc1 $t1, $f1 #um em float
		
		jal operacao
		
	final:	
		li $v0, 4 #leitura de string
		la $a0, fim
		syscall
		
		li $v0, 2
		syscall
		
		li $v0, 10
		syscall
		
	operacao:
		beq  $t0, $zero, parada #caso parada
		continue: 
			mtc1 $t0, $f0 #numero n
			div.s $f4, $f1, $f0
			add.s $f12, $f12, $f4 #numerp harmonico f2
			sub $t0, $t0, $t1 #diminui o n
			j operacao
		parada:
			jr $ra
