# Build is done by command 'make' of ds-5 altera compile instrument
# in the project folder

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
						-I$(SRCDIR)/screen/ \
						-I$(SRCDIR)/screen/uart

# Altera sources
ARCH 				:= arm
ALT_DEVICE_FAMILY 	?= soc_cv_av
SOCEDS_ROOT 		?= $(SOCEDS_DEST_ROOT)
HWLIBS_ROOT 		:= $(SOCEDS_ROOT)/ip/altera/hps/altera_hps/hwlib
INCLUDE_ALTERA 		:=	-I$(HWLIBS_ROOT)/include/$(ALT_DEVICE_FAMILY) \
						-I$(HWLIBS_ROOT)/include/

# Include
INC 				:= -D$(ALT_DEVICE_FAMILY) $(INCLUDE_ALTERA) $(INCLUDE_SOURCES)

CFLAGS 				:= -g -Wall -std=c++11 -pthread
LDFLAGS 			:= $(CFLAGS) -lstdc++

vpath %.cpp $(sort $(dir $(SOURCES)))

# Default make
default: clean info linking

linking: $(TARGET)
$(TARGET): $(OBJECTS)
	@echo ""; echo "<-- LINKING -->"
	@mkdir -p $(TARGETDIR)
	$(CC) $(LDFLAGS) $^ -o $@

$(BUILDDIR)/%.o: %.cpp
	@echo ""; echo "In folder: $(BUILDDIR)"
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

info:
	@echo ""; echo "<-- INFO -->"
	@echo "SOURCES = $(SOURCES)"
	@echo "OBJECTS = $(OBJECTS)"

# ATTENTION: this delete all the file specified below.
.PHONY: clean
clean:
	@echo ""; echo "<-- CLEANING -->";
	$(RM) -r $(BUILDDIR) $(TARGET)