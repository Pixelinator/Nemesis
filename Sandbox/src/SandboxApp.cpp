
#include <Nemesis.h>

class Sandbox : public Nemesis::Application
{
public:
	Sandbox(){}
	~Sandbox(){}
};

Nemesis::Application* Nemesis::CreateApplication()
{
	return new Sandbox();
}