import socket

#By Kenny Hooper


#Used to print board
def printBoard(fname):
                z= fname.decode("utf-8")
                print("  " + z[0] + " | " + z[1] + " | " + z[2])
                print(" ---+---+---")
                print("  " + z[3] + " | " + z[4] + " | " + z[5])
                print(" ---+---+---")
                print("  " + z[6] + " | " + z[7] + " | " + z[8])

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
 
ip = '64.183.98.170'                # assigns ip address
port = 3800                         # assigns port
    
s.connect((ip, port))               # Establishes connection to port
welcome = s.recv(1024)              # Gets welcome message  
X_or_O = s.recv(1024)               # Gets 'x/o' prompt
print(welcome.decode("utf-8"))      # *prints welcome message
print(X_or_O.decode("utf-8"))       # *prints "X/O?"

X_or_o = 'X'                          # set 'X' in varible Xmes
X = X_or_o.encode("utf-8")            # Encodes Xmes to byte form n varible X
s.send(X)                             # Send 'X' via varible X to server
print("You are " + X.decode("utf-8")) # *Prints out Client choice 'X'
i=0
moves=0

AvailibleMoves1 = s.recv(1024)      # Recevies avialible moves from server in this varible
z = AvailibleMoves1.decode("utf-8")
Game = z
while i < 9 :                           #Loop that runs until game is won or tied

    printBoard(AvailibleMoves1)         # Prints gameboard
    rest = z.split('\n', 1)[1]          # To get Client Move prompt without moves string
    print(rest)                         # To print Client Move prompt
    y = input("")                       # Allows user to enter move
    ClientMove1 = y.encode("utf-8")     # Sets move as varible Client Move 1 in bytes
    s.send(ClientMove1)                 # Send move to server via varible above

    

    serverMove1 = s.recv(1024)          # Recevies Server move from server in this varible


    AvailibleMoves1 = s.recv(1024)      # Recevies avialible moves from server in this varible
    z = AvailibleMoves1.decode("utf-8")
    Game = z
    if z[14] == 'W' or z[0]  == 'T' or z[4] == 'W': #Only true for either win or tie
            i=9  # to exit while loop
            moves = 10 # used for tie to avoid any other conditionals

    if moves > 9 and z[1] != 'X' and z[1] != 'O' or z[1] == 'X' and z[4]== 'W':

        hi=0 # Basicly here to prevent the other conditionals from running

    elif z[11] == 'O' and z[14]== 'W':      # Runs only if server wins
        printBoard(AvailibleMoves1)         # Prints Board
        print(serverMove1.decode("utf-8"))  # Prints server move
        Game = z.split('\n', 1)[1]          # Removes moves string from begining of statement to look cleaner
    else:
        print(serverMove1.decode("utf-8"))  # *Prints out server move


print(Game) # Prints out result of game

    
s.shutdown(2) #closes port