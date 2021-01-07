local basedirectory = _WORKING_DIR

workspace "oscpkt"
	configurations {"Debug", "Release"}
	location (path.join (basedirectory, "build"))
	targetdir (path.join (basedirectory, "bin"))

	for _, f in ipairs (os.matchfiles ("../examples/*.cc")) 
	do
		local name = path.getbasename (f)
		project (name)
			location (path.join (basedirectory, "build"))
			targetdir (path.join (basedirectory, "bin"))
			kind "ConsoleApp"
			language "C++"
			includedirs { ".." }
			files (f)
	end
	
	