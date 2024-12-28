#pragma once

#ifdef NMS_PLATFORM_WINDOWS
	#ifdef NMS_BUILD_DLL
		#define NMS_API __declspec(dllexport)
	#else
		#define NMS_API __declspec(dllimport)
	#endif
#else
	#error Nemesis only supports Windows!
#endif

#define BIT(x) (1 << x)