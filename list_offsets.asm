; ====================================================
; DLL-Injection-with-Assembly Copyright(C) 2017 Furkan Türkal
; This program comes with ABSOLUTELY NO WARRANTY; This is free software,
; and you are welcome to redistribute it under certain conditions; See
; file LICENSE, which is part of this source code package, for details.
; ====================================================


;[WARNING] :: This offsets only valid in this example EXE and DLL.
;             Plase don't use the same offsets in your project.


; (1) 750D3BFB --> [SAMPLE.DLL]

; (2) 750D3C0D --> [EntryPoint]

; (3) 7501B2D0 --> [LoadLibraryA]

; (4) 7501B980 --> [GetProccessAddress]

; (5) 750308B2 --> [Origin EntryPoint]

; (6) 750D3BAF --> [New EntryPoint]