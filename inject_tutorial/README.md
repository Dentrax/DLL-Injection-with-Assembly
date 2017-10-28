<h1 align="center">Injection Tutorial Source</h1>

**[list_offsets.asm](https://github.com/Dentrax/DLL-Injection-with-Assembly/blob/master/list_offsets.asm)** file was used as a `Temp` file in this tutorial. 

**[list_opcodes.asm](https://github.com/Dentrax/DLL-Injection-with-Assembly/blob/master/list_opcodes.asm)** file was used for inject `Assembly` codes.

* Used was sample.exe and sample.dll in this example.

[How To Inject](#how-to-inject)

## How To Inject

Step 1)
--------------------------

* 1) Open OllyDbg

* 2) Drag & Drop an EXE file to OllyDbg (`File > Open`)

* 3) Run the program with `F9`

> * While attaching in progress you will see `Running` text on the bottom right corner
> * When attaching completed, you will see `Paused` text on the bottom right corner


Step 2)
--------------------------

* 1) Now find a free space where you can add the `DLL` you want to inject.

* 2) Find `NOPS` or `DB 00` or any Part of .EXE (if that has no important Code)

> * If you are already choose the part where you want to inject the DLL, `Copy the Offset` of that part to temp list file.

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/1.png)

* 3) Select several consecutive blank lines.

* 4) Operate the Right Click -> Binary -> Edit (`CTRL + E`)

> * A MessageBox will appear with title : `Edit code at ...` and type the name of the your DLL.

> * Press `OK` button after typing the Name of the DLL

> * After pressing `OK` button, you will see random characters.

> * Be careful of typing the Name of the DLL in "ASCII", because Assembly code is upper & lower case sensitive.

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/2.png)


Step 3)
--------------------------

* 1) Press `CTRL + A` and the name will appear.

* 2) Skip few lines after the type name of your DLL and press `Space Bar`.
		
* 3) Type `EntryPoint`.

> * Copy the first paragraph's first line to clipboard with `Right Click -> Copy -> Clipboard` ( (1) in list_offests.asm)

> * Copy the second paragraph's first line to clipboard with `Right Click -> Copy -> Clipboard` ( (2) in list_offests.asm)

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/3.png)


Step 4)
--------------------------

* 1) Find a free space somewhere above the codes you wrote.

* 2) After find a free space, you should select several consecutive blank lines.

* 3) Operate the `Right Click -> Binary -> Fill with NOP's`

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/4.png)


Step 5)
--------------------------

* 1) Select the first paragraph's first line again.

* 2) Operate the `Right Click -> Assemble`

* 3) Type `push 772A3163` ( (1) in list_offests.asm)

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/5.png)


Step 6)
--------------------------

* 1) Select same line again and Now after that press `CTRL + N` and new window will appear.

* 2) Find and Copy the Offset of the `LoadLibraryA` 

* 3) Operate the `Right Click -> Copy to Clipboard -> Addess` ( (3) in list_offests.asm)

> * Please make sure copy the correct Line of LoadLibraryA Offset.

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/6.png)


Step 7)
--------------------------

* 1) Type `call dword ptr ds:[7501B2D0]` ( (3) in list_offests.asm)

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/7.png)

* 2) Type `push 750D3C0D` ( (2) in list_offests.asm)

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/8.png)

* 3) Type `push eax`

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/9.png)


Step 8)
--------------------------

* 1) Operate the `CTRL + N` again.

* 2) Find GETPROCESSADDRESS

* 3) Operate the `Right Click -> Copy to Clipboard -> Address`


Step 9)
--------------------------

* 1) Type `call dword ptr ds:[7501B980]` ( (4) in list_offests.asm)

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/10.png)

* 2) Type `push eax`

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/11.png)

* 3) Go to `origin` with `Right Click -> Go To -> Origin` and 

![Preview Thumbnail](https://raw.githubusercontent.com/Dentrax/DLL-Injection-with-Assembly/master/images/12.png)

* 4) Operate `Right Click -> Copy -> To Clipboard` ( (5) in list_offests.asm)

* 5) Return the codes again.

* 6) Type `JMP 750308B2` ( (5) in list_offests.asm)

* 7) Save the file.

> * `Right Click -> Copy -> Select All`

> * `Copy to executable -> All Modifications` and `copy all`

> * `Right Click -> Save File`

> * Return back to ASCII `sample.dll` and `Right Click -> Copy -> To clipboard`


Step 10)
--------------------------

* 1) Open `PE Explorer` and open the EXE file.

> * Change the Address of Entry Point to new EntryPoint.

* 2) Type `750D3BAF`

* 3) Click `GreenCheckBox` and `OK`, 

* 4) Operate `File > Save File As` and save the EXE

<kbd>EntryPoint changed and DLL injected successfully. Thats All.</kbd>


