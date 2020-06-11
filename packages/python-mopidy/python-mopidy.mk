################################################################################
#
# python-mopidy
#
################################################################################

PYTHON_MOPIDY_VERSION = 3.0.2
PYTHON_MOPIDY_SOURCE = Mopidy-$(PYTHON_MOPIDY_VERSION).tar.gz
PYTHON_MOPIDY_SITE = https://files.pythonhosted.org/packages/b0/6f/eaadbe67c5b99215bfa247257fc20cb997674f5ecf3765230ae92d456a74
PYTHON_MOPIDY_SETUP_TYPE = setuptools
PYTHON_MOPIDY_LICENSE = Apache-2.0
PYTHON_MOPIDY_LICENSE_FILES = LICENSE

$(eval $(python-package))
