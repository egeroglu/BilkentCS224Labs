	.data
	start:	.asciiz "give 4 values to calulate (A-b)modC + (d/b)modA: \n "

	.text
	 la $a0,start    # print newline
    	li $v0,4
   	syscall
   	
	li $v0,5
	syscall
	move $a0,$v0
	
	li $v0,5
	syscall
	move $a1,$v0
	
	li $v0,5
	syscall
	move $a2,$v0
	
	li $v0,5
	syscall
	move $a3,$v0
	

	#  (A-b) modC + (d/b) modA:
	
	sub $t0,$a0,$a1
	div $t0,$a2
	mfhi $t0
	
	div $a3,$a1
	mflo $t1
	div $t1,$a0
	mfhi $t1
	
	add $t0, $t0, $t1
	
	move $a0,$t0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	 