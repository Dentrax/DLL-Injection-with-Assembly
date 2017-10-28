<h1 align="center">Example DLL Source</h1>

[What It Is](#what-it-is)

## What It Is

> * dll_main_header : `Required header files for WinAPI and ASM Definitions`
> * dll_main_source : `Required DllMain api-entry-point. Its calling when DLL_PROCESS_ATTACH triggered from ASM.`

DllMain
--------------------------

Please see **[here](https://msdn.microsoft.com/en-us/library/windows/desktop/ms682583%28v=vs.85%29.aspx)** for more information about DllMain WinAPI entry-point.

**Syntax**

```c++
BOOL WINAPI DllMain(
  _In_ HINSTANCE hinstDLL,
  _In_ DWORD     fdwReason,
  _In_ LPVOID    lpvReserved
);
```

> * hinstDLL

* `A handle to the DLL module. The value is the base address of the DLL. The HINSTANCE of a DLL is the same as the HMODULE of the DLL, so hinstDLL can be used in calls to functions that require a module handle.`

> * fdwReason

* `The reason code that indicates why the DLL entry-point function is being called. This parameter can be one of the following values.`

* `DLL_PROCESS_ATTACH`
* `DLL_PROCESS_DETACH`
* `DLL_THREAD_ATTACH`
* `DLL_THREAD_DETACH`

> * lpvReserved

* `If fdwReason is DLL_PROCESS_ATTACH, lpvReserved is NULL for dynamic loads and non-NULL for static loads.`

* `If fdwReason is DLL_PROCESS_DETACH, lpvReserved is NULL if FreeLibrary has been called or the DLL load failed and non-NULL if the process is terminating.`

**Main**

```c++
BOOL APIENTRY DllMain(HANDLE hModule, DWORD  fdwReason, LPVOID lpvReserved) {
    switch( fdwReason ) {
        case DLL_PROCESS_ATTACH:
    
        case DLL_THREAD_ATTACH:
    
        case DLL_THREAD_DETACH:
    
        case DLL_PROCESS_DETACH:
     
    }
    return TRUE;
}
```

**Examples**

For an example, please see **[Dynamic-Link Library Entry-Point Function.](https://msdn.microsoft.com/en-us/library/windows/desktop/ms682596(v=vs.85).aspx)**