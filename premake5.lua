configuration "windows"
   platforms {"Win32", "x64"}

workspace "SimpleFileWatcherAll"
	configurations { "Debug", "Release" }
	location("build/" .. _ACTION)

	project "SimpleFileWatcher"
		location("build/" .. _ACTION .. "/SimpleFileWatcher")
		kind "StaticLib"
		language "C++"
		files {"source/*.cpp"}
		includedirs {"include"}
		targetdir "lib/%{cfg.buildcfg}"

		defines {"WIN_USE_WSTR"}
		filter "configurations:Debug"
			defines { "DEBUG" }
			symbols "On"
			
		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"
		
	-- A project defines one build target
	project "SimpleDemo"
		location("build/" .. _ACTION .. "/SimpleDemo")
		targetdir "bin/%{cfg.buildcfg}"
		kind "ConsoleApp"
		language "C++"
		files {
			"SimpleDemo.cpp"
		}
		
		links {"SimpleFileWatcher"}
		includedirs { "include" }
		
		defines {"WIN_USE_WSTR"}
		filter "configurations:Debug"
			defines { "DEBUG" }
			symbols "On"
			
		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "On"
workspace "SimpleFileWatcherAll"
	startproject("SimpleDemo")