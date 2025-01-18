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
IncludeDir["GLFW"] = "Nemesis/vendor/GLFW/include"

include "Nemesis/vendor/GLFW"

project "Nemesis"
    location "Nemesis"
    kind "SharedLib"
    language "C++"

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
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}"

    }

    links
    {
        "GLFW",
        "opengl32.lib"
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
        symbols "On"
    
    filter "configurations:Release"
        defines "NMS_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "NMS_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
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
        "Nemesis/vendor/spdlog/include",
        "Nemesis/src"
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
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "NMS_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "NMS_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "NMS_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "NMS_DIST"
        optimize "On"









