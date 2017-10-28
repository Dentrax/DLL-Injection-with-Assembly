#include "dll_main.h"

BOOL APIENTRY DllMain(HMODULE hModule, DWORD fdwReason, LPVOID lpvReserved)
{
	switch(fdwReason)
	{
		case DLL_PROCESS_ATTACH:
			{
					DisableThreadLibraryCalls(hModule);
					MessageBoxA(0, "OK", "OK", MB_OK);					
			}
			break;
	}
	return TRUE;
}