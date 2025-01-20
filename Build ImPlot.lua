project "ImPlot"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"


   -- Add the source files to the project
   files {
    "implot.h",
    "implot_internal.h",
    "implot.cpp",
    "implot_items.cpp",
    "implot_demo.cpp",
    }
    -- Add the include directories
   includedirs {
    "extern/glfw/include",
    "../imgui",
    "../imgui/extern/glfw/include",
    "../imgui/backends",
    "../glad/include",
   }

    -- Add the library directories
   libdirs {}
    
    -- Add the dependant project
   links {"ImGui"}

   targetdir ("bin/" .. OutputDir .. "/%{prj.name}")
   objdir ("bin/Intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"

    filter "action:vs*"
       buildoptions { "/MP" }  -- Enable multi-process compilation