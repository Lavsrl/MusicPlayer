.include "musica.asm"

.text
	#Carrega o vetor de bytes que est� no arquivo importado
	la $t0, musica 
	
	#Copia byte(RAM) e joga para registrador t1
	lb $t1, ($t0)
	
	#Numero do primeiro instrumento a tocar
	add $t2, $zero, 72
	
	loop:
		li $v0, 31 #Definir uso de audio
		add $a0, $zero, $t1 #a0 vai ser tratado como voz
		addi $a1, $zero, 700 #a1 � o tempo de dura��o
		add $a2, $zero, $t2 #a2 � tratado como instrumento
		addi $a3, $zero, 700 #a3 � o volume
		
		syscall
		
		li $v0, 32 #sleep
		addi $a0, $zero, 200
		syscall
		
		li $a1, 115
		syscall
		move $t2, $a0
		
		add $t0, $t0, 1 #Percorre o arquivo
		lb $t1, ($t0)
		bne $t1, -1, loop#Toca enquanto n�o encontrar o arquivo musica
