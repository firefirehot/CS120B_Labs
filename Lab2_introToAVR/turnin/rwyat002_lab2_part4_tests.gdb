# Test file for "Lab2_introToAVR"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

test "PINA: 0x00,PINB: 0x00, PINC: 0x00 => PORTD: 0x00"
setPINA 0x00
setPINB 0x00
setPINC 0x00
continue 2
expectPORTD 0x00
checkResult

test "PINA: 0x10,PINB: 0x10, PINC: 0x00 => PORTD: 0x20"
setPINA 0x10
setPINB 0x10
setPINC 0x00
continue 2
expectPORTD 0x20
checkResult

test "PINA: 0x80,PINB: 0x00, PINC: 0x00 => PORTD: 0x82"
setPINA 0x80
setPINB 0x00
setPINC 0x00
continue 2
expectPORTD 0x82
checkResult

test "PINA: 0x00,PINB: 0x00, PINC: 0x80 => PORTD: 0x82"
setPINA 0x00
setPINB 0x00
setPINC 0x80
continue 2
expectPORTD 0x82
checkResult

test "PINA: 0x0F,PINB: 0x80, PINC: 0x0F => PORTD: 0x9D"
setPINA 0x0F
setPINB 0x80
setPINC 0x0F
continue 2
expectPORTD 0x9D
checkResult

# Add tests below

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
