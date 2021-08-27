.text
	la 	$a0, size #ask for array size
	li $v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move 	$s0, $v0
 	li $t0, 0
# initialize array with user's inputs
loop:
  	li	$v0, 5
  	syscall
  	move $t3,$v0
  	sw 	$t3, array($t1)  
  	addi 	$t0, $t0, 1
  	
  	addi 	$t1, $t1, 4
  	bne 	$t0, $s0, loop
# initialize array with user's inputs
	li $t0,0
	li $t1,0
loop2:

  	lw   $t3, array($t1)  
  	move $a0,$t3
	li $v0,1
	syscall
 
  	addi 	$t0, $t0, 1
  	
  	addi 	$t1, $t1, 4
  	bne 	$t0, $s0, loop2
	
# check  
  	li 	$t0, 0
  	sll	$t1, $s0, 2  #multiply by 4 = 2^2
  	addi 	$t1, $t1, -4
test:
    	lw	$t5, array($t0)
    	lw	$t6, array($t1)
   	bne	$t5, $t6, notPal
    	addi	$t0, $t0, 4
    	addi 	$t1, $t1, -4
    	blt 	$t0, $t1, test
  	la 	$a0, pal
  	j 	done

notPal:
    	la	$a0, palN
    	j 	done

# print msg then terminate
done:
    	li	$v0, 4
    	syscall
    	li	$v0, 10
    	syscall
    	
	.data
array:	.space 80 # max 20 inputs
pal: 	.asciiz "\n Palindrome"
palN:	.asciiz "\n Not a palindrome"
size:	.asciiz "Enter the aray size: "
