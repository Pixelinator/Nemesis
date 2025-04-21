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

#ifdef NMS_ENABLE_ASSERTS
	#define NMS_ASSERT(x, ...) { if(!(x)) { NMS_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define NMS_CORE_ASSERT(x, ...) { if(!(x)) { NMS_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define NMS_ASSERT(x, ...)
	#define NMS_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define NMS_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)