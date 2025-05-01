workspace "Nemesis"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root directory of the project
IncludeDir = {}
IncludeDir["gtest"] = "vendor/gtest/googletest/include"
IncludeDir["spdlog"] = "Nemesis/vendor/spdlog/include"
IncludeDir["GLFW"] = "Nemesis/vendor/GLFW/include"
IncludeDir["Glad"] = "Nemesis/vendor/Glad/include"
IncludeDir["ImGui"] = "Nemesis/vendor/imgui"
IncludeDir["glm"] = "Nemesis/vendor/glm"

include "Nemesis/vendor/GLFW"
include "Nemesis/vendor/Glad"
include "Nemesis/vendor/imgui"

project "Nemesis"
    location "Nemesis"
    kind "SharedLib"
    language "C++"
    staticruntime "off"

    targetdir ("bin/" .. outputdir.. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir.. "/%{prj.name}")

    pchheader "nmspch.h"
    pchsource "Nemesis/src/nmspch.cpp"


    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{IncludeDir.spdlog}",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    defines {
		"_CRT_SECURE_NO_WARNINGS",
		"GLFW_INCLUDE_NONE"
	}

    buildoptions
    {
        "/utf-8"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "NMS_PLATFORM_WINDOWS",
            "NMS_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir.. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "NMS_DEBUG"
        buildoptions "/MDd"
        symbols "On"
    
    filter "configurations:Release"
        defines "NMS_RELEASE"
        buildoptions "/MD"
        optimize "On"
    
    filter "configurations:Dist"
        defines "NMS_DIST"
        buildoptions "/MD"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Nemesis/src",
        "%{IncludeDir.spdlog}",
        "%{IncludeDir.glm}"
    }

    links
    {
        "Nemesis"
    }

    buildoptions
    {
        "/utf-8"
    }

    filter "system:windows"
        cppdialect "C++17"
        systemversion "latest"

        defines
        {
            "NMS_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "NMS_DEBUG"
        runtime "Debug"
        symbols "On"
    
    filter "configurations:Release"
        defines "NMS_RELEASE"
        runtime "Release"
        optimize "On"
    
    filter "configurations:Dist"
        defines "NMS_DIST"
        runtime "Release"
        optimize "On"

project "GoogleTest"
    location "GoogleTest"
    kind "StaticLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "vendor/gtest/googletest/src/gtest-all.cc",
        "vendor/gtest/googletest/src/*.cc",
        "vendor/gtest/googletest/src/*.h"
    }

    includedirs
    {
        "vendor/gtest/googletest",
        "vendor/gtest/googletest/include",
        "%{IncludeDir.gtest}"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "NMS_PLATFORM_WINDOWS"
        }

project "NemesisTest"
    location "NemesisTest"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "Nemesis/src",
        "vendor/gtest/googletest/include",
        "%{IncludeDir.gtest}"
    }
    
    links
    {
        "Nemesis",
        "GoogleTest"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "NMS_PLATFORM_WINDOWS"
        }