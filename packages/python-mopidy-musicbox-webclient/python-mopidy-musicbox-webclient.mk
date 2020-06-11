################################################################################
#
# python-mopidy-jellyfin
#
################################################################################

PYTHON_MOPIDY_MUSICBOX_WEBCLIENT_VERSION = 3.1.0
PYTHON_MOPIDY_MUSICBOX_WEBCLIENT_SOURCE = Mopidy-MusicBox-Webclient-$(PYTHON_MOPIDY_MUSICBOX_WEBCLIENT_VERSION).tar.gz
PYTHON_MOPIDY_MUSICBOX_WEBCLIENT_SITE = https://files.pythonhosted.org/packages/9e/ca/95f08bf6fd4d14666fdadc9005784cf7b272fc2fa06198c359cf46264854
PYTHON_MOPIDY_MUSICBOX_WEBCLIENT_SETUP_TYPE = setuptools
PYTHON_MOPIDY_MUSICBOX_WEBCLIENT_LICENSE = Apache-2.0
PYTHON_MOPIDY_MUSICBOX_WEBCLIENT_LICENSE_FILES = LICENSE

$(eval $(python-package))
