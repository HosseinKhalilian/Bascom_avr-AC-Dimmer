'======================================================================='

' Title: AC Dimmer
' Last Updated :  01.2022
' Author : A.Hossein.Khalilian
' Program code  : BASCOM-AVR 2.0.8.5
' Hardware req. : Atmega16

'======================================================================='

$regfile = "m16def.dat"
$crystal = 4000000

Config Portb.0 = Output
Config Portd.6 = Input
Config Portd.7 = Input
Config Int0 = Falling

On Int0 Pow
Enable Interrupts
Enable Int0

Dim A As Eram Byte
Dim B As Byte
Dim C As Byte

If A > 9 Then A = 9

B = A
C = 0
Reset Portb.0

'-----------------------------------------------------------

Do

If Pind.7 = 1 Then
If B > 0 Then Decr B
Waitms 10
A = B
End If

If Pind.6 = 1 Then
If B < 9 Then Incr B
Waitms 10
A = B
End If

Loop

End

'-----------------------------------------------------------

Pow:

Reset Portb.0
For C = 0 To B
Waitus 200
Next C
Set Portb.0
Return

'-----------------------------------------------------------