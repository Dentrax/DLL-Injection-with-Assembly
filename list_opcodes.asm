; ====================================================
; DLL-Injection-with-Assembly Copyright(C) 2017 Furkan Türkal
; This program comes with ABSOLUTELY NO WARRANTY; This is free software,
; and you are welcome to redistribute it under certain conditions; See
; file LICENSE, which is part of this source code package, for details.
; ====================================================


;[WARNING] :: This offsets only valid in this example EXE and DLL.
;             Plase don't use the same offsets in your project.


;--- CHANGES :: SAMPLE.DLL 

;JNB SHORT KERNELBA.750D3C5E
;INS DWORD PTR ES:[EDI].DX
;JO SHORT KERNELBA.750D3C6C
;PREFIX GS:
;PREFIX CS:
;INS BYTE PTR ES:[EDI], DX
;INS BYTE PTR ES:[EDI], DX

;--- CHANGES :: EntryPoint

;INC EBP
;OUTS DX, BYTE PTR ES:[EDI]
;JE SHORT sample.772A37DB
;JNS SHORT sample.772A379D
;OUTS DX, DWORD PTR ES:[EDI]
;IMUL EBP, DWORD PTR DS:[ESI+74], 0

;--- CHANGES :: LoadLibraryA

;PUSH KERNELBA.750D3BFB
;CALL DWORD PTR DS:[LoadLibaryA]
;PUSH KERNELBA.750D3C0D
;PUSH EAX
;CALL DWORD PTR DS:[GetProcAddress]
;CALL EAX
;JMP sample.<ModuleEntryPoint>

