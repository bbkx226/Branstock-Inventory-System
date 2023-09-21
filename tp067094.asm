;Brandon Ban Kai Xian - TP067094

.model small ; memory model
.stack 100h ; stack size - allocates 256 bytes of stack space
.386 ; 32-bit instructions - Intel 80386 processor, to allow wider relative jump range

.data ; data segment - marks the beginning of the data section for declaring program data

; Headers and Default Mesasges
MENU_MESSAGE db 13, 10
             db '-----------------------<BranStock Management System>---------------------', 13, 10
             db '| __________                        _________ __                 __     |', 13, 10
             db '| \______   \____________    ____  /   _____//  |_  ____   ____ |  | __ |', 13, 10
             db '|  |    |  _/\_  __ \__  \  /    \ \_____  \\   __\/  _ \_/ ___\|  |/ / |', 13, 10
             db '|  |    |   \ |  | \// __ \|   |  \/_____|  \|  | (  <_> )  \___|    <  |', 13, 10
             db '|  |______  / |__|  (____  /___|  /_______  /|__|  \____/ \___  >__|_ \ |', 13, 10
             db '|         \/             \/     \/        \/                  \/     \/ |', 13, 10
             db '--------------------------------MAIN MENU--------------------------------', 13, 10
             db '|                         1. Explore Our Stock                          |', 13, 10
             db '|                         2. Sort by Categories                         |', 13, 10
             db '|                         3. Buy Products                               |', 13, 10
             db '|                         4. Replenish Supplies                         |', 13, 10
             db '|                         5. Generate Daily Report                      |', 13, 10
             db '|                         6. Make a Graceful Exit                       |', 13, 10
             db '-------------------------------------------------------------------------', 13, 10, '$' ; $ means end of the string

THANK_YOU_MSG db 13, 10
             db '-----------------------<BranStock Management System>---------------------', 13, 10
             db '| __________                        _________ __                 __     |', 13, 10
             db '| \______   \____________    ____  /   _____//  |_  ____   ____ |  | __ |', 13, 10
             db '|  |    |  _/\_  __ \__  \  /    \ \_____  \\   __\/  _ \_/ ___\|  |/ / |', 13, 10
             db '|  |    |   \ |  | \// __ \|   |  \/_____|  \|  | (  <_> )  \___|    <  |', 13, 10
             db '|  |______  / |__|  (____  /___|  /_______  /|__|  \____/ \___  >__|_ \ |', 13, 10
             db '|         \/             \/     \/        \/                  \/     \/ |', 13, 10
             db '-------------------------------------------------------------------------', 13, 10
             db '|           Thank you for using BrandonStock Management System!         |', 13, 10
             db '-------------------------------------------------------------------------', 13, 10, '$'

INVENTORY_HEADER db 13, 10
                 db '-----------------------<BranStock Management System>---------------------', 13, 10
                 db '|        .___                           __                              |', 13, 10
                 db '|        |   | _______  __ ____   _____/  |_  ___________ ___.__.       |', 13, 10
                 db '|        |   |/    \  \/ // __ \ /    \   __\/  _ \_  __ <   |  |       |', 13, 10
                 db '|        |   |   |  \   /\  ___/|   |  \  | (  <_> )  | \/\___  |       |', 13, 10
                 db '|        |___|___|  /\_/  \___  >___|  /__|  \____/|__|   / ____|       |', 13, 10
                 db '|                 \/          \/     \/                   \/            |', 13, 10
                 db '------------------------------INVENTORY----------------------------------', 13, 10
                 db 'ID',9,'Name',9,9,9,9,'Quantity',9,9,'Price(RM)',13,10,'$'

CATEGORIES_HEADER db 13, 10
                  db '-----------------------<BranStock Management System>---------------------', 13, 10
                  db '|        _________         __                                           |', 13, 10          
                  db '|        \_   ___ \_____ _/  |_  ____   ____   ___________ ___.__.      |', 13, 10 
                  db '|        /    \  \/\__  \\   __\/ __ \ / ___\ /  _ \_  __ <   |  |      |', 13, 10 
                  db '|        \     \____/ __ \|  | \  ___// /_/  >  <_> )  | \/\___  |      |', 13, 10 
                  db '|         \______  (____  /__|  \___  >___  / \____/|__|   / ____|      |', 13, 10 
                  db '|                \/     \/          \/_____/               \/           |', 13, 10 
                  db '--------------------------------CATEGORY---------------------------------', 13, 10
                  db '|                         1. Tablets                                    |', 13, 10
                  db '|                         2. Mobile Phones                              |', 13, 10
                  db '|                         3. Computers                                  |', 13, 10
                  db '|                         4. Exit to Main Menu                          |', 13, 10
                  db '-------------------------------------------------------------------------', 13, 10, '$'

TABLET_HEADER db 13, 10
              db '-----------------------<BranStock Management System>---------------------', 13, 10
              db '|            ___________     ___.   .__          __                     |', 13, 10
              db '|            \__    ___/____ \_ |__ |  |   _____/  |_  ______           |', 13, 10
              db '|              |    |  \__  \ | __ \|  | _/ __ \   __\/  ___/           |', 13, 10
              db '|              |    |   / __ \| \_\ \  |_\  ___/|  |  \___ \            |', 13, 10
              db '|              |____|  (____  /___  /____/\___  >__| /____  >           |', 13, 10
              db '|                           \/    \/          \/          \/            |', 13, 10
              db '----------------------------------Tablets--------------------------------', 13, 10
              db 'ID',9,'Name',9,9,9,9,'Quantity',9,9,'Price(RM)',13,10,'$'

PHONE_HEADER db 13, 10
             db '-----------------------<BranStock Management System>---------------------', 13, 10
             db '|                   _____        ___.   .__.__                          |', 13, 10
             db '|                  /     \   ____\_ |__ |__|  |   ____                  |', 13, 10
             db '|                 /  \ /  \ /  _ \| __ \|  |  | _/ __ \                 |', 13, 10
             db '|                /    Y    (  <_> ) \_\ \  |  |_\  ___/                 |', 13, 10
             db '|                \____|__  /\____/|___  /__|____/\___  >                |', 13, 10
             db '|                        \/           \/             \/                 |', 13, 10
             db '------------------------------Mobile Phones------------------------------', 13, 10
             db 'ID',9,'Name',9,9,9,9,'Quantity',9,9,'Price',13,10,'$'

COMPUTER_HEADER db 13, 10
          db '-----------------------<BranStock Management System>---------------------', 13, 10
          db '|       _________                               __                      |', 13, 10
          db '|       \_   ___ \  ____   _____ ______  __ ___/  |_  ___________       |', 13, 10
          db '|       /    \  \/ /  _ \ /     \\____ \|  |  \   __\/ __ \_  __ \      |', 13, 10
          db '|       \     \___(  <_> )  Y Y  \  |_> >  |  /|  | \  ___/|  | \/      |', 13, 10
          db '|        \______  /\____/|__|_|  /   __/|____/ |__|  \___  >__|         |', 13, 10
          db '|               \/             \/|__|                    \/             |', 13, 10
          db '--------------------------------Computers--------------------------------', 13, 10
          db 'ID',9,'Name',9,9,9,9,'Quantity',9,9,'Price(RM)',13,10,'$'

REPORT_HEADER db 13, 10
              db '-----------------------<BranStock Management System>---------------------', 13, 10
              db '|              __________                             __                |', 13, 10
              db '|              \______   \ ____ ______   ____________/  |_              |', 13, 10
              db '|               |       _// __ \\____ \ /  _ \_  __ \   __\             |', 13, 10
              db '|               |    |   \  ___/|  |_> >  <_> )  | \/|  |               |', 13, 10
              db '|               |____|_  /\___  >   __/ \____/|__|   |__|               |', 13, 10
              db '|                      \/     \/|__|                                    |', 13, 10
              db '-------------------------------Daily Report------------------------------', 13, 10
              db 'ID',9,'Name',9,9,9,'SOLD',9,9,'Price(RM)',9,'Total',13,10,'$'

TOTAL_PROFIT_MSG db '-------------------------------------------------------------------------', 13, 10
                 db '|       Congratulations! You havae raked in a substantial profit!       |', 13, 10
                 db '-------------------------------------------------------------------------', 13, 10, '$'
                 
; Constants
CATEGORY_OPTION_MSG  db 13, 'Select a category: $'
SELL_OPTION_MSG      db 13, 10, 'Insert Item ID to sell (e to exit to main menu): $'
SELL_QUANTITY_MSG    db 13, 10, 'How many do you want to sell?: $'
SELL_SUCCESS         db 13, 10, 'Item has successfully been sold!', 13, 10, '$'
RESTOCK_QUANTITY_MSG db 13, 10, 'How many do you want to restock?: $'
RESTOCK_OPTION_MSG   db 13, 10, 'Insert Item ID to restock (e to exit to main menu): $'
RESTOCK_SUCCESS      db 13, 10, 'Item has successfully been restocked!', 13, 10, '$'
USER_INPUT_MSG       db 13, 10, 'Pick Your Choice: $'
ENTER_RETURN_MSG     db 13, 10, 'Hit Enter to bounce back to the menu!$', 13,10
EXIT_MSG             db 13, 10,'Are you sure you want to exit (y/N): $', 13, 10
INVALID_INPUT        db 'Oops! Invalid input. Please try again.', '$'
SELL_LIMIT_EXCEEDED  db 'Sorry, you cannt sell more than what is in stock!', '$' 
MAX_STOCK_REACHED    db 'Oh no! This item is already at its maximum stock (9)!', '$' 
CRLF                 db 13, 10, '$'  ; 13 - \r (carriage return), 10 - \n (line feed)
LINECLOSE            db '-------------------------------------------------------------------------', 13, 10, '$' ; Closing Line

; Inventory
; What is dw? - dw is a directive that tells the assembler to reserve 2 bytes of memory for each value in the list.
; What is db? - db is a directive that tells the assembler to reserve 1 byte of memory for each value in the list.
INVENTORY dw 0,1,2,3,4,5,6,7,8,9
          db 'iPad Pro  ', 'Tab S9    ', 'ROG Strix ', 'Macbook   ', 'Tuf Gaming', 'iPhone 13 ', 'Z Flip 5  ', 'Z Fold 5  ', 'Reno R9   ', 'Galaxy S10'
          dw 10, 9, 6, 20, 13, 5, 2, 6, 3, 12, 5400, 6499, 5700, 11500, 6000, 3800, 5000, 7299, 1300, 439, '$'
StockID   dw ?
SOLDITEM  dw 3,7,6,2,3,13,1,3,10,20,'$' ; Random values for generating report
ITEMPRICE dw 5400, 6499, 5700, 11500, 6000, 3800, 5000, 7299, 1300, 439, '$'

.code ; the start of the code section in an assembly program
; Macro is a sequence of instructions that is assigned a name and can be used multiple times in a program.
ShowMsg MACRO Msg ; Msg - Parameter
    lea  dx, Msg ; load effective address of the Msg parameter into the dx register | dx is often used for storing the memory address of strings
    mov  ah, 9 ; display a string of characters on the screen
    int  21h ; int 21h is a software interrupt that invokes the DOS operating system to perform a specific task
ENDM ; marks the end of the macro definition  

DisplayMenu:
    ShowMsg MENU_MESSAGE
    ShowMsg USER_INPUT_MSG
    ret

InventoryMenu:
    call ClearScreen
    call ViewItem
    call ReturnToMenu
    jmp main_loop

CategoryMenu:
    call ClearScreen
    ShowMsg CATEGORIES_HEADER
    ShowMsg CATEGORY_OPTION_MSG

    mov ah,01h
    int 21h

    cmp al,'1'
    je Tablets
    cmp al,'2'
    je Phones
    cmp al,'3'
    je Computers
    cmp al,'4'
    je main_loop

    ShowMsg CRLF
    ShowMsg INVALID_INPUT
    ShowMsg CRLF
    jmp CategoryMenu

SellMenu:
    ShowMsg CRLF
    call ViewItem
    call SellItem    

RestockMenu:
    ShowMsg CRLF
    call ViewItem
    call RestockItem

DailyReportMenu:
    call ClearScreen
    ShowMsg REPORT_HEADER
    call GenerateReport
    call ReturnToMenu
    jmp main_loop
    
Tablets:
    call ClearScreen
    ShowMsg TABLET_HEADER

    mov bp, 0                ; Initialize the base pointer (bp) to 0
    lea si, INVENTORY       ; Load the address of the INVENTORY data structure into si
    
    LoopForTablets:
        mov ax, [si]         ; Load the inventory ID into ax
        cmp ax, 0            ; Compare the ID with 0
        je displayTablets   

        mov ax, [si]         ; Reload the inventory ID into ax
        cmp ax, 1            ; Compare the ID with 1 (Tab S9)
        je displayTablets       ; Jump to 'displayItem' if ID is 1 (Tab S9)

        cmp ax, 10            ; Compare the ID with 10
        ja DoneLoopingTablets ; Jump to 'done' if ID is greater than 10

        jmp skipTablets    

    skipTablets:
        add bp, 10            ; Add 10 to the base pointer to move to the next inventory name
        add si, 2             ; Increment SI by 2 to point to the next word in the inventory array
        jmp LoopForTablets         ; Jump back to the beginning of the loop for the next element
    
    displayTablets: 
        call IntegerConversion
        call GenerateTab

        mov dx, offset INVENTORY + 20  ; skip the first 20 bytes, which includes the IDs
        add dx, bp ; Add the base pointer (bp) to dx to point to the next word
        call PrintString

        call GenerateTab        
        call GenerateTab        
        call GenerateTab    

        mov ax, [si + 120]    ; Load the inventory price into ax
        call ValidateQty
        ; mov ax, [si + 120]    ; Load the inventory stock into ax
        call IntegerConversion
        
        call GenerateTab        
        call GenerateTab        
        call GenerateTab        

        mov ax, [si + 140]    ; Load some other data associated with the inventory item
        call IntegerConversion
        call GenerateNewLine

        jmp skipTablets

    DoneLoopingTablets:
        ShowMsg LINECLOSE
        call ReturnToMenu
        jmp CategoryMenu
        ret

Phones:
    call ClearScreen
    ShowMsg PHONE_HEADER
    mov bp, 0                ; Initialize the base pointer (bp) to 0
    lea si, INVENTORY       ; Load the address of the INVENTORY data structure into si
    
    LoopForPhones:
        mov ax, [si]         ; Load the inventory ID into ax
        cmp ax, 5            ; Compare the ID with 0
        je displayPhones   

        mov ax, [si]         ; Reload the inventory ID into ax
        cmp ax, 6            
        je displayPhones    

        mov ax, [si]         ; Reload the inventory ID into ax
        cmp ax, 7            
        je displayPhones     

        mov ax, [si]         ; Reload the inventory ID into ax
        cmp ax, 8            
        je displayPhones       

        mov ax, [si]         ; Reload the inventory ID into ax
        cmp ax, 9            
        je displayPhones      

        cmp ax, 10
        ja DoneLoopingPhones               ; Jump to 'done' if ID is greater than 10

        jmp skipPhones    

    skipPhones:
        add bp, 10            ; Add 10 to the base pointer to move to the next inventory name
        add si, 2             ; Increment SI by 2 to point to the next word in the inventory array
        jmp LoopForPhones         ; Jump back to the beginning of the loop for the next element

    displayPhones: 
        call IntegerConversion

        call GenerateTab

        mov dx, offset INVENTORY + 20  ; skip the first 20 bytes, which includes the IDs
        add dx, bp            ; Add the base pointer (bp) to dx to point to the next word
        call PrintString

        call GenerateTab        
        call GenerateTab        
        call GenerateTab        

        mov ax, [si + 120]    ; Load the inventory price into ax
        call ValidateQty
        mov ax, [si + 120]    ; Load the inventory stock into ax
        call IntegerConversion
        call GenerateTab        
        call GenerateTab        
        call GenerateTab        

        mov ax, [si + 140]    ; Load some other data associated with the inventory item
        call IntegerConversion
        call GenerateNewLine
        
        jmp skipPhones

    DoneLoopingPhones:
        ShowMsg LINECLOSE
        call ReturnToMenu
        jmp CategoryMenu
        ret

Computers:
    call ClearScreen
    ShowMsg COMPUTER_HEADER
    mov bp, 0                ; Initialize the base pointer (bp) to 0
    lea si, INVENTORY       ; Load the address of the INVENTORY data structure into si
    
    LoopForComputers:
        mov ax, [si]         ; Load the inventory ID into ax
        cmp ax, 2            ; Compare the ID with 0
        je displayComputers   

        mov ax, [si]         ; Reload the inventory ID into ax
        cmp ax, 3            ; Compare the ID with 1 (Tab S9)
        je displayComputers         ; Jump to 'displayItem' if ID is 1 (Tab S9)

        cmp ax, 10            ; Compare the ID with 10
        ja DoneLoopingComputers               ; Jump to 'done' if ID is greater than 10

        jmp skipComputers    

    skipComputers:
        add bp, 10            ; Add 10 to the base pointer to move to the next inventory name
        add si, 2             ; Increment SI by 2 to point to the next word in the inventory array
        jmp LoopForComputers         ; Jump back to the beginning of the loop for the next element

    displayComputers: 
        call IntegerConversion

        call GenerateTab

        mov dx, offset INVENTORY + 20  ; skip the first 20 bytes, which includes the IDs
        add dx, bp            ; Add the base pointer (bp) to dx to point to the next word
        call PrintString

        call GenerateTab        
        call GenerateTab        
        call GenerateTab        

        mov ax, [si + 120]    ; Load the inventory price into ax
        call ValidateQty
        mov ax, [si + 120]    ; Load the inventory stock into ax
        call IntegerConversion
        call GenerateTab        
        call GenerateTab        
        call GenerateTab        

        mov ax, [si + 140]    ; Load some other data associated with the inventory item
        call IntegerConversion
        call GenerateNewLine

        jmp skipComputers 

    DoneLoopingComputers:
        ShowMsg LINECLOSE
        call ReturnToMenu
        jmp CategoryMenu
        ret

ViewItem:
    ShowMsg INVENTORY_HEADER  ; Display the inventory header message

    xor bp, bp               ; Initialize the base pointer (bp) to 0 | Equals to mov bp, 0
    lea si, INVENTORY        ; Load the address of the INVENTORY data structure into si

    LoopStart:
        mov ax, [si]          ; The square brackets are used to dereference the pointer, which means that the value at the memory address pointed to by the pointer is loaded into the ax register.
        cmp ax, 10            ; Compare the ID with 10
        ja done               ; Jump to 'done' if ID is greater than 10
        
        call IntegerConversion  ; Call a subroutine to print the inventory ID
        call GenerateTab        ; Call a subroutine to print a tab character

        mov dx, offset INVENTORY + 20  ; Take the offset address of TABLE | skip the first 20 bytes, which includes the IDs | dx is also used to store the memory address of strings
        add dx, bp            ; Add the base pointer (bp) to dx to point to the next word
        call PrintString
        
        call GenerateTab        
        call GenerateTab
        call GenerateTab

        mov ax, [si + 120]    ; Load the inventory price into ax
        call ValidateQty
        ; mov ax, [si + 120]    ; Load the inventory stock into ax
        call IntegerConversion
        
        call GenerateTab        
        call GenerateTab        
        call GenerateTab        

        mov ax, [si + 140] ; Load some other data associated with the inventory item
        call IntegerConversion        

        call GenerateNewLine

        add bp, 10 ; Add 10 to the base pointer to move to the next inventory name
        add si, 2 ; Increment SI by 2 to point to the next word in the inventory array
        jmp LoopStart

    done:
        ShowMsg LINECLOSE
        ret

SellItem:
    ShowMsg SELL_OPTION_MSG

    mov ah, 01
    int 21h

    CheckLowercaseForSell:
        cmp al, 'e'
        je main_loop

        cmp al, 'E'
        je main_loop

    cmp al, '0'
    jb InvalidInputForSell
    cmp al, '9'
    ja InvalidInputForSell

    sub al, 30h ; The ASCII values corresponding to the characters '0' through '9' are '30H' through '39H'. To obtain the numerical values 0 through 9, you simply subtract '30H' from their respective ASCII values.
    add al, al ; Multiply the value by 2 to convert it to an index, but why?
    sub ax, 136 ; Subtract 136 from the value to convert it to an index
    mov StockID, ax

    ShowMsg SELL_QUANTITY_MSG
    mov ah, 01
    int 21h
    sub al, 30h ; subtracts the ASCII value of '0' from the value read from the keyboard, effectively converting the character representing the quantity into its numerical value.
    sub ax, 256
    mov cx, ax

    lea si, INVENTORY
    add si, StockID
    mov bx, [si] ; load stock into bx
    sub bx, cx
    cmp bx, 0
    js SellError ; If the quantity entered is greater than the quantity in stock, the code jumps to the SellError label | js is a conditional jump instruction that jumps if the sign flag is set (SF = 1)

    mov word ptr [si], bx ; what is word? - word is a directive that tells the assembler to reserve 2 bytes of memory for each value in the list.
    mov ax, StockID
    sub ax, 120
    mov StockID, ax
    lea si, SOLDITEM
    add si, StockID
    mov ax, [si]
    add cx, ax 
    mov word ptr [si], cx

    call ClearScreen
    ShowMsg CRLF
    ShowMsg SELL_SUCCESS
    ShowMsg CRLF
    call ViewItem
    call ReturnToMenu ; calls the ReturnToMenu macro
    jmp main_loop

    InvalidInputForSell:
        ShowMsg CRLF
        ShowMsg INVALID_INPUT
        ShowMsg CRLF
        jmp SellMenu

    SellError:
        ShowMsg CRLF
        ShowMsg SELL_LIMIT_EXCEEDED
        ShowMsg CRLF
        call ReturnToMenu
        call SellMenu

RestockItem:
    ShowMsg RESTOCK_OPTION_MSG

    mov ah, 01
    int 21h

    CheckLowercaseForRestock:
        cmp al, 'e'
        je main_loop

        cmp al, 'E'
        je main_loop

    cmp al, '0'
    jb InvalidInputForRestock ; If the user enters a value less than 0, the code jumps to the InvalidInput label.
    cmp al, '9'
    ja InvalidInputForRestock

    sub al, 30h ; convert to integer
    add al, al
    sub ax, 136
    mov StockID, ax

    ShowMsg RESTOCK_QUANTITY_MSG
    mov ah, 01
    int 21h
    sub al, 30h ; subtracts the ASCII value of '0' from the value read from the keyboard, effectively converting the character representing the quantity into its numerical value.
    sub ax, 256
    mov cx, ax

    lea si, INVENTORY
    add si, StockID
    add cx, [si]
    mov word ptr [si], cx 

    call ClearScreen
    ShowMsg CRLF
    ShowMsg RESTOCK_SUCCESS
    ShowMsg CRLF
    call ViewItem
    call ReturnToMenu ; calls the ReturnToMenu macro
    jmp main_loop

    InvalidInputForRestock:
        ShowMsg CRLF
        ShowMsg INVALID_INPUT
        ShowMsg CRLF
        jmp SellMenu

GenerateReport:
    mov bp, 0
    lea si, INVENTORY
    mov bx, offset SOLDITEM 
    mov di, offset ITEMPRICE ; di is used to store the memory address of strings

    LoopForReport:
        mov ax, [si]
        cmp ax, 10
        ja DoneLoopingReport 
        call IntegerConversion

        call GenerateTab

        mov dx, offset INVENTORY + 20
        add dx, bp
        call PrintString

        call GenerateTab
        call GenerateTab

        mov ax, [bx]
        call IntegerConversion

        call GenerateTab
        call GenerateTab

        mov ax, [si + 140]
        call IntegerConversion
    
        call GenerateTab
        call GenerateTab

        mov cx, [bx]
        mov ax, [di]
        mul cx
        call IntegerConversion

        ShowMsg CRLF
        add bp, 10
        add si, 2 ; increment SI to point to the next word
        add bx, 2 
        add di, 2
        jmp LoopForReport ; repeat the loop for the next element
    
    DoneLoopingReport:
        ShowMsg TOTAL_PROFIT_MSG
        ret

ConfirmExit:
    ShowMsg EXIT_MSG
    mov ah,01h
    int 21h
    
    cmp al, 'n'
    je main_loop
    cmp al, 'N'
    je main_loop
    cmp al, 'y'
    je ExitConfirmed
    cmp al, 'Y'
    je ExitConfirmed
    ShowMsg CRLF
    ShowMsg INVALID_INPUT
    ShowMsg CRLF
    jmp ConfirmExit


    ExitConfirmed:
        call ClearScreen
        ShowMsg THANK_YOU_MSG
        jmp ExitProgram

ReturnToMenu:
    ShowMsg ENTER_RETURN_MSG
    mov ah, 01h
    int 21h
    cmp al, 0Dh ; 0Dh - carriage return
    jne ReturnToMenu ; If the user did not press the Enter key, the code jumps to the ReturnToMenu label.
    ret ; returns to the calling function

ClearScreen: ; Function to clear the screen
    mov ah, 06h ; scroll the screen up
    mov al, 0 ; clear the entire screen
    mov bh, 07h ; di    splay attribute (white on black)
    mov cx, 0 ; upper left corner (row 0, column 0)
    mov dx, 184Fh ; lower right corner (row (18 hex) 24 dec, column (4F hex) 79 dec)
    int 10h ; call interrupt 10h to scroll the screen up
    ret

ExitProgram:
    mov ah,4Ch ; terminates the program
    int 21h
    
ValidateQty:
  ; check if the word is less than or equal to 5
  mov bx, ax ; Copies the value in the ax register (assuming it contains a 16-bit integer) into the bx register
  cmp bx, 5 ; Compares the value in the bx register with the value 5
  jle PrintRedBlink ; jle - jump if less than or equal to
  ret

PrintRedBlink:
  ; Print a string of characters
  ; Input: CX = length of string, DX = offset of string
  push ax ; save the values of the ax, bx, and cx registers onto the stack
  push bx
  push cx
  mov bx, dx ; set BX to the offset of the string
  mov cx, 4  ; set the length to 4 characters
  xor bh, bh ; to ensure that the high byte of bx is clear before performing the loop operation

  LoopForBlink:
    mov dl, [bx] ; loads a character from memory at the address pointed to by bx into the dl register
    mov ah, 09h ; write character and attribute at cursor position
    mov al, dl ; The character loaded from memory is placed in the al register, preparing it for display. | the int 10h service requires the character to be displayed to be in the al register
    mov bl, 04h ; bl is used to set the background color to red
    or bl, 80h ; 80h = 10000000 | sets the high bit of the bl register to 1, potentially indicating a blinking attribute
    int 10h ; display the character in al with the specified background color (black with blink)
    inc bx ; increment offset to next character
    xor bh, 80h ; This clears the high bit (bit 7) of the bh register, a common practice to ensure that the high byte is properly set
    loop LoopForBlink ; repeat until all characters are printed

  DoneLoopingOne:
    pop cx ; restore registers
    pop bx
    pop ax
  ret

IntegerConversion:
  ; converts a 16-bit integer value in the ax register to its corresponding ASCII string representation and then prints that string
  push bx ; why push? - to save the value of the bx register onto the stack, to ensure that the bx register is not overwritten by the subroutine
  mov bx, 10 ; set BX to 10 (divisor), converting the integer to a decimal representation
  xor cx, cx ; why clear cx? - to ensure that the counter is clear before performing the division operation

  LoopForConversion:
    xor dx, dx ; clear the high byte of DX, to ensure that dx is clear before performing the division operation
    div bx ; divide AX by BX
    add dl, '0' ; convert the remainder to ASCII
    push dx ; save the digit on the stack
    inc cx ; increment the counter
    cmp ax, 0 ; check if AX is zero
    jne LoopForConversion ; if not, repeat the loop

  DoneLoopingTwo:
    pop dx ; get the next digit from the stack
    mov ah, 02 ; write character
    int 21h ; print the digit
    dec cx ; decrement the counter
    cmp cx, 0 ; check if all digits have been printed
    jne DoneLoopingTwo ; if not, repeat the loop
    pop bx ; restore BX from the stack
    ret



PrintString:
  push ax
  push bx
  push cx
  mov bx, dx ; set BX to the offset of the string
  mov cx, 10 ; set the length to 10 characters
 
  LoopForPrinting:
    mov dl, [bx] ; load character from memory
    int 21h ; output the character
    inc bx ; increment offset to next character
    loop LoopForPrinting ; repeat until 10 characters are printed
  
  DoneLoopingThree:
    pop cx ; restore registers
    pop bx
    pop ax
    ret

GenerateNewLine:
  mov dl, 0ah ; ASCII value for new line
  mov ah, 02 ; write character
  int 21h
  ret

GenerateTab:
  mov dl, 09 ; dl is often used for storing the ASCII value of a tab character | ASCII value of tab character is 09
  mov ah, 02
  int 21h
  ret

; Main Function
; MAIN PROC is a function that is called when the program is executed.
main proc
    mov ax, @Data ; ax is the only register that can be used to load the segment register | @Data represents the starting address of the data segment
    mov ds, ax ; ds register ensures that data accesses within the program use the correct segment

    main_loop:
        call ClearScreen
        call DisplayMenu
        mov ah, 01h ; read a single character from the keyboard | why ah? It's reserved for passing the function code to the interrupt service
        int 21h

        cmp al, '1' ; why al ? the ASCII values of characters '1' through '6' reside in the lower 8 bits (bits 0-7) of the AL register
        je InventoryMenu
        cmp al, '2'
        je CategoryMenu
        cmp al, '3'
        je SellMenu
        cmp al, '4'
        je RestockMenu
        cmp al, '5'
        je DailyReportMenu
        cmp al, '6'
        je ConfirmExit

        ShowMsg CRLF
        ShowMsg INVALID_INPUT
        ShowMsg CRLF
        call ReturnToMenu
        jmp main_loop

main endp
end main
