#
# Copyright (c) 2005, 2006, 2009 Thorsten Kukuk <kukuk@suse.de>
#

CLEANFILES = *~
MAINTAINERCLEANFILES = $(MANS) README

EXTRA_DIST = README $(MANS) $(XMLS) tst-pam_securetty

TESTS = tst-pam_securetty

man_MANS = pam_securetty.8
XMLS = README.xml pam_securetty.8.xml

securelibdir = $(SECUREDIR)
secureconfdir = $(SCONFIGDIR)

AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include
AM_LDFLAGS = -no-undefined -avoid-version -module
if HAVE_VERSIONING
  AM_LDFLAGS += -Wl,--version-script=$(srcdir)/../modules.map
endif
if HAVE_VENDORDIR
  AM_CFLAGS += -DVENDORDIR=\"$(VENDORDIR)\"
endif

securelib_LTLIBRARIES = pam_securetty.la
pam_securetty_la_LIBADD = $(top_builddir)/libpam/libpam.la

if ENABLE_REGENERATE_MAN
noinst_DATA = README
README: pam_securetty.8.xml
if HAVE_VENDORDIR
XSLTPROC_CUSTOM = --stringparam vendordir $(VENDORDIR)
else
XSLTPROC_CUSTOM = --stringparam vendordir "<vendordir>"
endif
-include $(top_srcdir)/Make.xml.rules
endif
