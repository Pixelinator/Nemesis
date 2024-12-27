#pragma once

#include <memory>
#include <spdlog/spdlog.h>

#include "Core.h"

namespace Nemesis {
	class NMS_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core log macros
#define NMS_CORE_TRACE(...) ::Nemesis::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define NMS_CORE_INFO(...) ::Nemesis::Log::GetCoreLogger()->info(__VA_ARGS__)
#define NMS_CORE_WARN(...) ::Nemesis::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define NMS_CORE_ERROR(...) ::Nemesis::Log::GetCoreLogger()->error(__VA_ARGS__)
#define NMS_CORE_FATAL(...) ::Nemesis::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define NMS_TRACE(...) ::Nemesis::Log::GetClientLogger()->trace(__VA_ARGS__)
#define NMS_INFO(...) ::Nemesis::Log::GetClientLogger()->info(__VA_ARGS__)
#define NMS_WARN(...) ::Nemesis::Log::GetClientLogger()->warn(__VA_ARGS__)
#define NMS_ERROR(...) ::Nemesis::Log::GetClientLogger()->error(__VA_ARGS__)
#define NMS_FATAL(...) ::Nemesis::Log::GetClientLogger()->fatal(__VA_ARGS__)