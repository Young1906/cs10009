	.data 
s0: .ascii "[+]Input a character: \0"
s1: .ascii "[+]Prev char of input character: \0"
s2: .ascii "[+]Uppercase char of input character: \0"
	.text 
	.globl main
main:
	li $v0, 4		# syscall 4: call print_string
	la $a0, s0		# load address of x into register $a0
	syscall			
	
	li $v0, 12		# syscall 12: call read_char, value stored at $v0
	syscall
	
	add $t0, $v0, $zero	# store input char into $t0 register
	li $v0, 11		# syscall 11: print_char
	li $a0, 0xA		# newline
	syscall
	
	li $v0, 4		# print 2nd prompt
	la $a0, s1		# load address of the string into @a0
	syscall
	
	li $v0, 11
	subi $a0, $t0, 1
	syscall
	
	li $v0, 11		# syscall 11: print_char
	li $a0, 0xA		# newline
	syscall
	
	li $v0, 4		# print 2nd prompt
	la $a0, s2		# load address of the string into @a0
	syscall
	
	li $v0, 11		# syscall print_char
	subi $a0, $t0, 32	# subtract 32 from input char (convert to uppercase)
	syscall			
	
	li $v0, 10		# exit
	syscall
