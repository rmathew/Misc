# A Makefile that tries to be POSIX-compliant:
#   https://pubs.opengroup.org/onlinepubs/9699919799/utilities/make.html
#   https://nullprogram.com/blog/2017/08/20/
#
# and is therefore limited and inefficient:
#   https://dwheeler.com/essays/make.html
#
# NOTE: Test with at least gmake, bmake, and pmake to verify compliance.
.POSIX:

# Purge built-in suffix-based inference-rules to speed up builds.
.SUFFIXES:
.SUFFIXES: .c .o

# Include system-specific configuration for the build.
include config.mk

PKG = hello
VER = 0.1.0

PRG = hello_world

SRCS = \
       driver/main.c \
       \
       greeter/greeter.c \

OBJS = $(SRCS:.c=.o)
DEPS = $(SRCS:.c=.d)

INCS = -Igreeter

all: $(PRG)

$(PRG): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $@ $(LDLIBS)

install: $(PRG)
	$(MKDIR_P) $(DESTDIR)$(PREFIX)/bin
	$(CP_Q) $(PRG) $(DESTDIR)$(PREFIX)/bin
	@echo $(PKG)-$(VER) has been installed to $(DESTDIR)$(PREFIX).

uninstall:
	$(RM_Q) $(DESTDIR)$(PREFIX)/bin/$(PRG)
	-$(RMDIR) $(DESTDIR)$(PREFIX)/bin
	-$(RMDIR) $(DESTDIR)$(PREFIX)
	@echo $(PKG)-$(VER) has been uninstalled from $(DESTDIR)$(PREFIX).

clean:
	$(RM_Q) $(DEPS)
	$(RM_Q) $(OBJS)
	$(RM_Q) $(PRG)

depend: $(OBJS) $(DEPS)
	$(MK_DEPEND_MK)

# NOTE: Use `make depend` to update this file with auto-generated dependencies.
# GNU Make automatically updates depend.mk if there is a target for it, even
# for `make clean`, so we use a phony target for it to avoid wasted work.
include depend.mk

# NOTE: .PHONY is widely supported and has been accepted into POSIX, but is not
# yet in a published version of the standard.
.PHONY: all clean depend install uninstall
