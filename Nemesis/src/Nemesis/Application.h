#pragma once
#include "Core.h"
#include "Events/Event.h"

namespace Nemesis
{
	class NMS_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	Application *CreateApplication();
}
