
#####################################################################
# 																	#
#	HOW TO USE THIS MASTERPIECE										#
#																	#
# 	Build is done by command 'make' of ds-5 altera compile			#
#	instrument in the project folder.								#
#																	#
# 	OPTIONAL arguments (targets):									#
#	1. Fast 	- building changed files							#
#	2. Default 	- full rebuilding									#
#	3. Info 	- gives info about build							#
#																	#
#####################################################################

#Compiler and Linker
CC					:= arm-linux-gnueabihf-gcc

#The Target Binary Program
SRCDIR      		:= HPS
TARGET_NAME 		:= PrinterSystem
TARGETDIR   		:= $(SRCDIR)/bin
TARGET 				:= $(TARGETDIR)/$(TARGET_NAME)

#The Directories, Source, Includes, Objects, Binary and Resources
BUILDDIR 			:= $(SRCDIR)/build
SOURCES 			:= $(shell find $(SRCDIR) -type f -name *.cpp)
OBJECTS 			:= $(addprefix $(BUILDDIR)/,$(patsubst %.cpp,%.o,$(notdir $(SOURCES))))
INCLUDE_SOURCES 	:= 	-I$(SRCDIR) \
						-I$(SRCDIR)/Mechanics/ \
						-I$(SRCDIR)/Mechanics/Controller \
						-I$(SRCDIR)/Printer/ \
						-I$(SRCDIR)/Printer/Controller \
						-I$(SRCDIR)/Printer/GCodeParser \
						-I$(SRCDIR)/Printer/STL2GCode/ \
						-I$(SRCDIR)/Screen/ \
						-I$(SRCDIR)/Screen/UART \
						-I$(SRCDIR)/Screen/PageObjects \
						-I$(SRCDIR)/Screen/Controller \
						-I$(SRCDIR)/Printer/FileManager

# Altera sources
ARCH 				:= arm
ALT_DEVICE_FAMILY 	?= soc_cv_av
SOCEDS_ROOT 		?= $(SOCEDS_DEST_ROOT)
HWLIBS_ROOT 		:= $(SOCEDS_ROOT)/ip/altera/hps/altera_hps/hwlib
INCLUDE_ALTERA 		:=	-I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY) \
						-I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY)/socal \
						-I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY)/sys \
						-I$(HWLIBS_ROOT)/include/

# Include
INC 				:= -D$(ALT_DEVICE_FAMILY) $(INCLUDE_ALTERA) $(INCLUDE_SOURCES)

WARNINGS 			:= -Wall # -pedantic
HIDE_WARNINGS		:= -Wno-pointer-arith -Wno-sign-compare
CFLAGS 				:= -g -std=c++11 -pthread -lm $(WARNINGS) $(HIDE_WARNINGS)
LDFLAGS 			:= $(CFLAGS) -lstdc++

vpath %.cpp $(sort $(dir $(SOURCES)))

#
#	TARGETS TO USE
#

# Fast make
fast: linking done

# Default make
full: clean info linking done

# show info
info:
	@echo ""; echo "<-- INFO -->"
	@echo "SOURCES = $(SOURCES)"
	@echo "OBJECTS = $(OBJECTS)"
	@echo ""

#
#	DO NOT CALL THIS TARGETS BELOW MANUALLY
#

linking: $(TARGET)
$(TARGET): $(OBJECTS)
	@echo ""; echo "<-- LINKING -->"
	@mkdir -p $(TARGETDIR)
	@$(CC) $(LDFLAGS) $^ -o $@

$(BUILDDIR)/%.o: %.cpp
	@echo "BUILDING $<"
	@mkdir -p $(BUILDDIR)
	@$(CC) $(CFLAGS) $(INC) -c $< -o $@

# ATTENTION: this delete all the file specified below.
.PHONY: clean
clean:
	@echo ""; echo "<-- CLEANING -->";
	$(RM) -r $(BUILDDIR) $(TARGET)

done:
	@echo "<-- DONE -->"
