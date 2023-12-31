workspace "CompGraphic"
	architecture "x64"
	startproject "CurveEditor"

	configurations
	{
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Engine/vendor/GLFW/include"
IncludeDir["Glad"] = "Engine/vendor/Glad/include"
IncludeDir["glm"] = "Engine/vendor/glm"
IncludeDir["stb_image"] = "Engine/vendor/stb_image"
IncludeDir["entt"] = "Engine/vendor/entt/include"
IncludeDir["yaml_cpp"] = "Engine/vendor/yaml-cpp/include"
IncludeDir["ImGui"] = "Engine/vendor/imgui"


group "Dependencies"
	include "Engine/vendor/GLFW"
	include "Engine/vendor/Glad"
	include "Engine/vendor/yaml-cpp"
	include "Engine/vendor/imgui"

group ""

project "Engine"
	location "Engine"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "pch.h"
	pchsource "Engine/src/pch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/stb_image/**.h",
		"%{prj.name}/vendor/stb_image/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.stb_image}",
		"%{IncludeDir.entt}",
		"%{IncludeDir.yaml_cpp}",
		"%{IncludeDir.ImGui}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		"yaml-cpp",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"GLFW_INCLUDE_NONE"
		}

	filter "configurations:Debug"
		defines "EG_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "EG_RELEASE"
		runtime "Release"
		optimize "on"


project "CurveEditor"
	location "CurveEditor"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
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
		"Engine/src",
		"Engine/vendor",
		"CurveEditor/src",
		"%{IncludeDir.glm}",
		"%{IncludeDir.entt}",
	}

	links
	{
		"Engine"
	}

	filter "system:windows"
		systemversion "latest"


	filter "configurations:Debug"
		defines "EG_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "EG_RELEASE"
		runtime "Release"
		optimize "on"


project "FillingTool"
	location "FillingTool"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
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
		"Engine/src",
		"Engine/vendor",
		"FillingTool/src",
		"%{IncludeDir.glm}",
		"%{IncludeDir.entt}",
	}
	
	links
	{
		"Engine"
	}
	
	filter "system:windows"
		systemversion "latest"
	
	
	filter "configurations:Debug"
		defines "EG_DEBUG"
		runtime "Debug"
		symbols "on"
	
	filter "configurations:Release"
		defines "EG_RELEASE"
		runtime "Release"
		optimize "on"
	
	
project "Fractals"
	location "Fractals"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
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
		"Engine/src",
		"Engine/vendor",
		"Fractals/src",
		"%{IncludeDir.glm}",
		"%{IncludeDir.entt}",
	}
		
	links
	{
		"Engine"
	}
		
	filter "system:windows"
		systemversion "latest"
		
		
	filter "configurations:Debug"
		defines "EG_DEBUG"
		runtime "Debug"
		symbols "on"
		
	filter "configurations:Release"
		defines "EG_RELEASE"
		runtime "Release"
		optimize "on"
		
		