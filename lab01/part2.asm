
	.text
	la $a0,start #Welcome message
	li $v0, 4
	syscall
	
	li $v0, 5 #take a
	syscall
	move $a0, $v0
	
	li $v0, 5 #take b
	syscall
	move $a1, $v0
	
	li $v0, 5 #take c
	syscall
	move $a2, $v0
	
	li $v0, 5 #take 
	syscall
	move $a3, $v0
	
	jal calc
	
	la $a0,result
	li $v0, 4
	syscall
	
	move $a0, $t4
	li $v0, 1
	syscall
	
	li $v0,10
	syscall
calc:
	sub $t0, $a1, $a2 # (b-c)
	move $t1, $a0
	mult $t0, $t1 # a*(b-c)
	mflo $t2
	move $t3, $a3
	div $t2,$t3 # a*(b-c)%d
	mfhi $t4
	
	jr $ra

	.data
start:	.asciiz "enter 4 values to calculate a*(b-c)%d \n"
result:	.asciiz "Result is "
