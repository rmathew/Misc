# Where to install the software.
PREFIX = /usr/local

# Which compiler and linker-wrapper to use.
CC = cc

# Which checks to perform on the source-code.
CHK_FLAGS = -std=c99 -Wall -Wextra -Wpedantic -Werror -pedantic-errors

# How much to optimize the generated code.
OPT_FLAGS = -DNDEBUG -O2 -g0

# How to instruct the compiler to generate a make-compliant ".d" dependency-
# file as the side-effect of compiling a ".c" file.
#
# WARNING: This only works with GCC and compilers that emulate its flags.
DEP_FLAGS = -MT $(<:.c=.o) -MMD -MP

# Which flags to pass to the C compiler.
CFLAGS = $(INCS) $(CHK_FLAGS) $(OPT_FLAGS)

# Which flags to pass to the linker-wrapper.
LDFLAGS =

# Which extra libraries to include during the linking step.
LDLIBS =

# Gather the automatically-generated dependency-information into a single file.
MK_DEPEND_MK = sort -u $(DEPS) | sed 's/^[ \t]*$$//' | sed '/^$$/d' > depend.mk

# How to create an object-file from source-code.
.c.o:
	$(CC) $(CFLAGS) $(DEP_FLAGS) -c $< -o $@

# How to remove a file without complaining about missing files.
RM_Q = rm -f

# How to copy a file without complaining about existing files.
CP_Q = cp -f

# How to create a directory and intermediate directories as needed.
MKDIR_P = mkdir -p

# How to remove an empty directory.
RMDIR = rmdir
