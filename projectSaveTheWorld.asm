# Name: Kenny Hooper
# Assignment: Final project
# Goal: To save the world

.include "KennyHooperMacros_HW5s"
.data
start:
Found:    .asciiz "That letter is a part of the passcode. Good word\n "
Passcode: .asciiz "Passcode: "
YouLose: .asciiz "You lose. Press 1 to exit. Press any other button to try again"
Wrong: .asciiz "Incorrect entry. Please try again."
buff:	.byte	' '
hero1: 	.asciiz "  \n  o   \n"
hero2:  .asciiz   "*-|-* \n"
hero3: 	.asciiz   " / \\ \n"
blank:  .asciiz "_"
space:  .asciiz " "
skipLine: .asciiz "  \n"

letterFound:   .space 1024  # to hold letters found
wrongLetter:   .space 1024  # to hold letters found

Prompt: .asciiz 			"Please enter a lower case letter: "


.text
main:
la 	$a3, letterFound	# loads string to hold correct guesses
la	$s3, wrongLetter
li	$t5, 0			# user wrong answers
la	$s4, hero1		# load level one her0
la	$s5, hero2		# load level 2 hero
la	$s6, hero3		# load level 3 hero
user: loadSecretWord $a2	# loads mystery word
la	$t3, blank		# hold blank spaces to use
la 	$t4, buff		# holds user input
li	$t6, 0			# switch for correct awnser.
li	$t8,0			# counter for loop
#prompt for user input
la $a0,Prompt
li $v0,4
syscall


#reads user input
li $v0,12
syscall
sb $v0, 0($t4)			# save user character input to t4 value
lb $t2,0($t4)            	# load user character value to t2

#prints first line of hero
li $v0, 4
la $a0, hero1
syscall

#prints 2ns line of hero
li $v0, 4
la $a0, hero2
syscall

#prints 3rd line of hero
li $v0, 4
la $a0, hero3
syscall


# loop to search for user letter in array
loop: lbu $t9,0($a2)	#loads value of current letter in secret word
lbu $t2,buff		#loads value entered by user into t2
beq $t9,$zero, reset	# if value of current secret word's letter is 0, leaves loop
beq $t2,$t9,found 	# if t2 (user char) = t9 (current secret letter), jumps to found where function is ran


lb $t7, 0($a3)
bne $t7,$zero,skipBlank # will skip past adding a blank space to letter found string
lb      $t1,blank       # loads blank space to t1
sb      $t1,0($a3)      # saves blank space to user found letters

skipBlank: addi $a2, $a2, 1 	# points to next letter in secret woord
addi $a3, $a3, 1		# points to next letter in letter found string
addi $t8,$t8,1			# loop counter interated
lbu $t9,0($a2)			# loads next letter in secret word



beq $t9,$zero, reset # leaves loop if blank byte is loaded
j loop


found: 
jal FoundLetter # goes to f(x)
j loop # back to loop


exit:
li $v0, 10
syscall

#resets values and goes back to user for input
reset:
sub $a2, $a2, $t8 # puts pointer on secret word back to first value
sub $a3, $a3, $t8 # puts pointer on letter found string but to first value

# To print: "Passcode: "
li $v0, 4
la $a0, Passcode
syscall

#to print out letters already found
li $v0, 4
la $a0, ($a3)
syscall

#to skip line
li $v0, 4
la $a0, skipLine
syscall

bne $t6,$zero, user		# if $t6 is true, will skip interating incorrect attemps
jal AddOneToUserWrongAnswers	# 


j user


# to interate counter for wrong answers
AddOneToUserWrongAnswers: addi $t5,$t5,1

li $v0, 4
la $a0, Wrong
syscall

#Skips line
li $v0, 4
la $a0, skipLine
syscall
beq $t5, 9,lose # jumps to lose message

beq $t5,1,rightPower
beq $t5,2,leftPower
beq $t5,3,rightArm
beq $t5,4,leftArm
beq $t5,5,rightLeg
beq $t5,6,leftLeg
beq $t5,7,body
beq $t5,8,head

rightPower:
lb $s7, space
sb $s7, 4($s5)  ###new line

j loser

leftPower:
lb $s7, space
sb $s7, 0($s5)  ###new line

j loser



leftArm:
lb $s7, space
sb $s7, 1($s5)  ###new line

j loser

rightArm:
lb $s7, space
sb $s7, 3($s5)  ###new line

j loser

leftLeg:
lb $s7, space
sb $s7, 1($s6)  ###new line

j loser

rightLeg:
lb $s7, space
sb $s7, 3($s6)  ###new line

j loser

body:
lb $s7, space
sb $s7, 2($s5)  ###new line

j loser

head:
lb $s7, space
sb $s7, 5($s4)  ###new line


loser:
jr $ra

FoundLetter:
li $t6,1 			# to switch found boolean to true

lb      $t1,buff              # loads user char to t1
sb      $t1,0($a3)            # saves user char to letterFound array

# Annouces that letter was found
li $v0, 4
la $a0, Found
syscall

#Skips line
li $v0, 4
la $a0, skipLine
syscall

addi $a2, $a2, 1 	# points to next letter in secret woord
addi $a3, $a3, 1	# points to next letter in letters found
addi $t8,$t8,1		# loop counter interated
lbu $t9,0($a2)		# loads next letter in secret word

jr $ra #returns

lose: 

#prompt for user input
la $a0,YouLose
li $v0,4
syscall


#reads user input
li $v0,5
syscall
sb $v0, 0($t4)			# save user character input to t4 value
lb $t2,0($t4)            	# load user character value to t2
beq $t2,1,exit
j main
