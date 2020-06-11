################################################################################
#
# python-mopidy-jellyfin
#
################################################################################

PYTHON_MOPIDY_JELLYFIN_VERSION = 0.8.1
PYTHON_MOPIDY_JELLYFIN_SOURCE = Mopidy-Jellyfin-$(PYTHON_MOPIDY_JELLYFIN_VERSION).tar.gz
PYTHON_MOPIDY_JELLYFIN_SITE = https://files.pythonhosted.org/packages/6c/bc/a2401de11eb8caf7f2ce49ee327c81ba6c765e3373d71283a5ee3a5c2d20
PYTHON_MOPIDY_JELLYFIN_SETUP_TYPE = setuptools
PYTHON_MOPIDY_JELLYFIN_LICENSE = Apache-2.0
PYTHON_MOPIDY_JELLYFIN_LICENSE_FILES = LICENSE

$(eval $(python-package))
