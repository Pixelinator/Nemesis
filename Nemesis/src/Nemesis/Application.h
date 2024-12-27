#pragma once
#include "Core.h"

namespace Nemesis {
	class NMS_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	Application* CreateApplication();
}
