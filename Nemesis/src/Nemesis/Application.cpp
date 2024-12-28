#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Log.h"

namespace Nemesis {
	Application::Application()
	{
	}
	Application::~Application()
	{
	}
	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			NMS_TRACE(e.ToString());
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			NMS_TRACE(e.ToString());
		}
		while (true);
	}
}