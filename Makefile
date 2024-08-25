# Makefile for zipping a Minecraft modpack

# Rule to create the output directory if it doesn't exist
create_output_dir:
	mkdir -p final

# Rule to zip the bin, config, and mods directories into a zip file
zip_modpack: create_output_dir
	rm -f final/modpack.zip
	zip -r final/modpack.zip bin config mods

# Default target to build the zip
build: zip_modpack

# Phony target to clean up the generated zip file
.PHONY: clean
clean:
	rm -f final/modpack.zip
