version_info = (0, 0, 2)
__title__ = "jt64common"
__version__ = '.'.join(str(c) for c in version_info)
__name__ = "jt64common"
__author__ = "Greg Beam, KI7MT"
__license__ = "GPLv3"
__email__ = "ki7mt@yahoo.com"

# Supported QT version List
__qt_version_list__ = ['5.12.2', '5.12.3']
__qt_version_dict__ = {'5.12.2': 'Mingw GCC 7.3.0 x86_64',
                        '5.12.3': 'Mingw GCC 7.3.0 x86_64'}

__all__ = [__title__, __version__, __name__, __author__, __license__, __email__,
            __qt_version_dict__, __qt_version_list__]