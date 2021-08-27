	.data
	start:	.asciiz "give 3 values to calulate (B/C+D*B-C) Mod B: \n "

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

	# A  = (B / C + D * B - C ) Mod B
	
	div $a0, $a1
	mflo $t0
	mult $a0,$a2
	mflo $t1
	add $t2,$t0,$t1
	sub $t3,$t2,$a1
	div $t3,$a0
	mfhi $t4
	
	move $a0,$t4
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	 
	