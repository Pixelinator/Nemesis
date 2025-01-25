#include <Nemesis.h>

class ExampleLayer : public Nemesis::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}
	void OnUpdate() override
	{
		NMS_INFO("ExampleLayer::Update");
	}
	void OnEvent(Nemesis::Event& event) override
	{
		NMS_TRACE("{0}", event.ToString());
	}
};

class Sandbox : public Nemesis::Application
{
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}
	~Sandbox(){}
};

Nemesis::Application* Nemesis::CreateApplication()
{
	return new Sandbox();
}