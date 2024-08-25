# Makefile for zipping a Minecraft modpack and server

# Directories and file paths
OUTPUT_DIR := final
CLIENT_MODPACK_ZIP := $(OUTPUT_DIR)/modpack.zip
SERVER_MODPACK_ZIP := $(OUTPUT_DIR)/server_modpack.zip

# Default target to build both client and server zips
build: zip_modpack zip_server_modpack

# Rule to create the output directory if it doesn't exist
create_output_dir:
	mkdir -p $(OUTPUT_DIR)

# Rule to zip the bin, config, and mods directories into a zip file for the client
zip_modpack: create_output_dir
	rm -f $(CLIENT_MODPACK_ZIP)
	zip -r $(CLIENT_MODPACK_ZIP) bin config mods

# Rule to zip the server directory into a zip file for the server
zip_server_modpack: create_output_dir
	rm -f $(SERVER_MODPACK_ZIP)
	zip -r $(SERVER_MODPACK_ZIP) server

# Phony target to clean up the generated zip files
.PHONY: clean
clean:
	rm -f $(CLIENT_MODPACK_ZIP) $(SERVER_MODPACK_ZIP)