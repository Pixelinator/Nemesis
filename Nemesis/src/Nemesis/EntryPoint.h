#pragma once
#ifdef NMS_PLATFORM_WINDOWS

extern Nemesis::Application* Nemesis::CreateApplication();

int main(int argc, char** argv) {
	Nemesis::Application* app = Nemesis::CreateApplication();
	app->Run();
	delete app;
}

#else
#error Nemesis only supports Windows!
#endif