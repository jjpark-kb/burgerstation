dmm_suite

	/*-- read_map ------------------------------------
	Generates map instances based on provided DMM formatted text. If coordinates
	are provided, the map will start loading at those coordinates. Otherwise, any
	coordinates saved with the map will be used. Otherwise, coordinates will
	default to (1, 1, world.maxz+1)
	*/
	read_map(dmm_text as text, coordX as num, coordY as num, coordZ as num, tag as text, overwrite as num, angleOffset as num)
		if(tag) log_debug("Attempting to load map [tag] at ([coordX],[coordY],[coordZ])...")
		. = 0
		if(angleOffset)
			angleOffset = MODULUS(round(angleOffset,90), 360)
		else
			angleOffset = 0
		// Split Key/Model list into lines
		var/key_len
		var/list/grid_models[0]
		var/startGridPos = findtext(dmm_text, "\n\n(1,1,") // Safe because \n not allowed in strings in dmm
		var/startData = findtext(dmm_text, "\"")
		var/linesText = copytext(dmm_text, startData + 1, startGridPos)
		var/list/modelLines = splittext(linesText, regex(@{"\n\""}))
		//Go through all the map keys and set them up properly.
		for(var/modelLine in modelLines) // "aa" = (/path{key = value; key = value},/path,/path)\n
			var/endQuote = findtext(modelLine, quote, 2, 0)
			if(endQuote <= 1)
				continue
			var/modelKey = copytext(modelLine, 1, endQuote)
			if(!key_len)
				key_len = length(modelKey)
				log_debug("Setting key length to [key_len].")
			var/modelsStart = findtextEx(modelLine, "/") // Skip key and first three characters: "aa" = (
			var/modelContents = copytext(modelLine, modelsStart, length(modelLine)) // Skip last character: )
			grid_models[modelKey] = modelContents //We have now stored the key representing the turf.
			sleep(-1)
		if(!coordX) coordX = 1
		if(!coordY) coordY = 1
		if(!coordZ) coordZ = world.maxz+1
		// Store quoted portions of text in text_strings, and replaces them with an index to that list.
		var/gridText = copytext(dmm_text, startGridPos)

		// WIP
		// \(([0-9]*),([0-9]*),([0-9]*)\) = \{"\s*([A-z\s]+)"\}
		// \(([0-9]*),([0-9]*),([0-9]*)\) = \{"((?:[^\}]*))

		//Positioned Keys:             1        2        3                  4
		if(key_len < 1) CRASH("key_len was impossibly less than 1 ([key_len])!")
		var/maxXFound = 0
		var/maxYFound = 0
		var/maxZFound = 0
		//TGM AND DMM ARE NOT THE SAME IN TERMS OF (1,1,1) COORDS. GOD HELP ME.
		//Below 3 vars help with determining the format.
		/*
		var/tgm_format = TRUE
		var/last_x
		var/last_z
		*/
		var/list/gridLevels = list()
		var/list/coordShifts = list()
		var/regex/grid = regex(@{"\(([0-9]*),([0-9]*),([0-9]*)\) = \{"\n((?:[A-z]*\n)*)"\}"}, "g") //Retrieve the coord line thing.
		var/grid_instances = 0
		while(grid.Find(gridText))
			grid.group[1] = text2num(grid.group[1])
			grid.group[2] = text2num(grid.group[2])
			grid.group[3] = text2num(grid.group[3])
			/*
			if(tgm_format && last_x && grid.group[1] != last_x && last_z && grid.group[3] == last_z)
				tgm_format = FALSE
			last_x = grid.group[1]
			last_z = grid.group[3]
			*/
			gridLevels.Add(copytext(grid.group[4], 1, -1)) // Strip last \n. TGM Format would add the y-axis. Non-TGM format would add the entire z-axis.
			coordShifts.Add(
				list(
					list(grid.group[1], grid.group[2], grid.group[3])
				)
			)
			maxZFound = max(maxZFound, grid.group[3]) //z. Will always be 1 unless the map has a second z-level for some reason.
			grid_instances ++

		log_debug("Found [grid_instances] grid instances.")

		if(maxZFound+(coordZ-1) > world.maxz)
			world.maxz = maxZFound+(coordZ-1)
			log_debug("Z levels increased to [world.maxz].")

		var/turfs_loaded = 0
		for(var/posZ=1,posZ<=maxZFound,posZ++)
			CHECK_TICK_SAFE(50,FPS_SERVER)
			var/zGrid = reverseList(text2list(gridLevels[posZ], "\n"))

			maxXFound = max(length(pick(zGrid))/key_len,length(gridLevels))
			if(world.maxx < maxXFound+(coordX-1))
				world.maxx = maxXFound+(coordX-1)
				log_debug("X level increased to [world.maxx].")

			maxYFound = length(zGrid)
			if(world.maxy < maxYFound+(coordY-1))
				world.maxy = maxYFound+(coordY-1)
				log_debug("Y level increased to [world.maxy].")

			var/gridCoordX = coordShifts[posZ][1] + (coordX - 1)
			var/gridCoordY = coordShifts[posZ][2] + (coordY - 1)
			var/gridCoordZ = coordShifts[posZ][3] + (coordZ - 1)

			log_debug("coordShifts\[posZ\]\[3\]: [coordShifts[posZ][3]], coordZ: [coordZ], gridCoordZ: [gridCoordZ].")

			if(overwrite)
				for(var/posY = 1 to maxXFound)
					for(var/posX = 1 to maxYFound)
						var/grid_x = gridCoordX - 1
						var/grid_y = gridCoordY - 1
						var/offset_x = posX
						var/offset_y = posY
						var/turf/T = locate(grid_x + offset_x,grid_y + offset_y, gridCoordZ)
						for(var/k in T)
							var/datum/x = k
							if(overwrite & DMM_OVERWRITE_OBJS && istype(x, /obj))
								qdel(x)
								if(overwrite & DMM_OVERWRITE_MARKERS && istype(x,/obj/marker/))
									qdel(x)
							else if(overwrite & DMM_OVERWRITE_MOBS && istype(x, /mob))
								qdel(x)
							CHECK_TICK_SAFE(50,FPS_SERVER)

			for(var/posY=1,posY<=maxYFound,posY++)
				var/y_line = zGrid[posY]
				for(var/posX=1,posX<=maxXFound,posX++)


					var/grid_x = (gridCoordX - 1) //Origin loc.
					var/grid_y = (gridCoordY - 1) //Origin loc

					var/offset_x = posX
					var/offset_y = posY

					switch(angleOffset)
						if(0)
							offset_x = posX
							offset_y = posY
						if(90)
							offset_x = posY
							offset_y = maxXFound - posX
						if(180) //Works
							offset_x = maxXFound - posX //Negative x
							offset_y = maxYFound - posY //Negative y

						if(270)
							offset_x = maxYFound - posY
							offset_y = posX

					var/keyPos = ((posX-1)*key_len)+1
					var/modelKey = copytext(y_line, keyPos, keyPos+key_len)
					var/turf/location = locate(grid_x + offset_x,grid_y + offset_y,gridCoordZ)
					if(!location)
						CRASH("dmm_suite: Invalid location! ([grid_x + offset_x],[grid_y + offset_y],[gridCoordZ])")
					turfs_loaded++
					. += parse_grid(
						grid_models[modelKey],
						location,
						angleOffset,
						overwrite

					)
					CHECK_TICK_SAFE(50,FPS_SERVER)

		if(tag)
			log_debug("dmm_suite loaded [turfs_loaded] turfs and [.] total objects for [tag] ([maxXFound],[maxYFound],[maxZFound]).")

		return .

//-- Supplemental Methods ------------------------------------------------------

	var
		quote = "\""
		regex/comma_delim = new("\[\\s\\r\\n\]*,\[\\s\\r\\n\]*")
		regex/semicolon_delim = new("\[\\s\\r\\n\]*;\[\\s\\r\\n\]*")
		regex/key_value_regex = new("^\[\\s\\r\\n\]*(\[^=\]*?)\[\\s\\r\\n\]*=\[\\s\\r\\n\]*(.*?)\[\\s\\r\\n\]*$")

	proc
		parse_grid(models as text, var/turf/location, angleOffset, overwrite, debug)
			if(debug)
				log_debug("Parsing grid: \"[models]\" at [location ? location.get_debug_name() : "NULL"]")
			. = 0
			/* Method parse_grid() - Accepts a text string containing a comma separated list
				of type paths of the same construction as those contained in a .dmm file, and
				instantiates them.*/
			// Store quoted portions of text in text_strings, and replace them with an index to that list.
			var/list/originalStrings = list()
			var/regex/noStrings = regex("(\[\"\])(?:(?=(\\\\?))\\2(.|\\n))*?\\1")
			var/stringIndex = 1
			var/found
			do
				found = noStrings.Find(models, noStrings.next)
				if(found)
					var/indexText = {""[stringIndex]""}
					stringIndex++
					var/match = copytext(noStrings.match, 2, -1) // Strip quotes
					models = noStrings.Replace(models, indexText, found)
					originalStrings[indexText] = (match)
			while(found)
			// Identify each object's data, instantiate it, & reconstitues its fields.
			for(var/atomModel in splittext(models, comma_delim))
				var/bracketPos = findtext(atomModel, "{")
				var/atomPath = text2path(copytext(atomModel, 1, bracketPos))
				var/list/attributes
				if(bracketPos)
					attributes = new()
					var/attributesText = copytext(atomModel, bracketPos+1, -1)
					var/list/paddedAttributes = splittext(attributesText, semicolon_delim) // "Key = Value"
					for(var/paddedAttribute in paddedAttributes)
						key_value_regex.Find(paddedAttribute)
						attributes[key_value_regex.group[1]] = key_value_regex.group[2]
				. += loadModel(atomPath, attributes, originalStrings, location, angleOffset, debug)

		loadModel(atomPath, list/attributes, list/strings, var/turf/location, angleOffset, debug)
			// Cancel if atomPath is a placeholder (DMM_IGNORE flags used to write file)
			if(ispath(atomPath, /turf/dmm_suite/clear_turf) || ispath(atomPath, /area/dmm_suite/clear_area))
				if(debug) log_debug("Canceling due to clear area/turf...")
				return 0
			// Parse all attributes and create preloader
			var/list/attributesMirror = list()
			if(!location)
				if(debug) log_debug("Invalid loadModel location!")
				return 0

			for(var/attributeName in attributes)
				attributesMirror[attributeName] = loadAttribute(attributes[attributeName], strings)
			var/dmm_suite/preloader/preloader = new(location, attributesMirror)
			// Begin Instanciation
			// Handle Areas (not created every time)
			var/atom/instance
			if(ispath(atomPath, /area)) //Don't set instances for areas.
				new atomPath(location)
				location.dmm_preloader = null
			// Handle Underlay Turfs
			else if(ispath(atomPath, /turf))
				if(ispath(atomPath, /turf/dmm_suite/no_wall))
					if(is_simulated(location))
						var/turf/simulated/S = location
						if(S.density)
							if(S.destruction_turf)
								instance = new S.destruction_turf(location)
							else
								instance = new /turf/simulated/floor/cave_dirt(location)
					else if(istype(location,/turf/unsimulated/generation))
						var/turf/unsimulated/generation/G = location
						G.density = FALSE
					else
						instance = new /turf/simulated/floor/cave_dirt(location)
				else
					instance = new atomPath(location)
			else if(atomPath)
				instance = new atomPath(location)
				if(angleOffset)
					instance.dir = turn(instance.dir,-angleOffset)
			if(preloader && instance) // Atom could delete itself in New(), or the instance could be an area.
				preloader.load(instance)
			//
			return (instance ? 1 : 0)

		loadAttribute(value, list/strings)
			//Check for string
			if(copytext(value, 1, 2) == "\"")
				return strings[value]
			//Check for number
			var/num = text2num(value)
			if(isnum(num))
				return num
			//Check for file
			else if(copytext(value,1,2) == "'")
				return get_cached_file(copytext(value,2,length(value)))
				// return file(copytext(value,2,length(value)))
			// Check for lists
				// To Do


//-- Preloading ----------------------------------------------------------------

turf
	var
		dmm_suite/preloader/dmm_preloader

atom/New(turf/newLoc)
    if(isturf(newLoc))
        var/dmm_suite/preloader/preloader = newLoc.dmm_preloader
        if(preloader)
            newLoc.dmm_preloader = null
            preloader.load(src)
    . = ..()

dmm_suite
	preloader
		parent_type = /datum
		var
			list/attributes
		New(turf/loadLocation, list/_attributes)
			loadLocation.dmm_preloader = src
			attributes = _attributes
			. = ..()
		proc
			load(atom/newAtom)
				var/list/attributesMirror = attributes // apparently this is faster
				for(var/attributeName in attributesMirror)
					newAtom.vars[attributeName] = attributesMirror[attributeName]