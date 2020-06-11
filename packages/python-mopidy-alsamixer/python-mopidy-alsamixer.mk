################################################################################
#
# python-mopidy-alsamixer
#
################################################################################

PYTHON_MOPIDY_ALSAMIXER_VERSION = 2.0.0
PYTHON_MOPIDY_ALSAMIXER_SOURCE = Mopidy-ALSAMixer-$(PYTHON_MOPIDY_ALSAMIXER_VERSION).tar.gz
PYTHON_MOPIDY_ALSAMIXER_SITE = https://files.pythonhosted.org/packages/b9/66/e43534c100f48f0779191d3e7819e909ce39eff7f8eba71dc218897131fc
PYTHON_MOPIDY_ALSAMIXER_SETUP_TYPE = setuptools
PYTHON_MOPIDY_ALSAMIXER_LICENSE = Apache-2.0
PYTHON_MOPIDY_ALSAMIXER_LICENSE_FILES = LICENSE

$(eval $(python-package))
