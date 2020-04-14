## Docker Ubuntu Image

### Ubuntu image for Web automation (Python 3.7, Selenium, Chrome, Firefox).

Python 3 with Chromedriver, for running Selenium web automated tests.

Contains:

- Ubuntu v18.04
- Python 3.7
- Selenium
- Chrome
- Firefox

### List of aditional packages

| #  | Package                               |                                      Description                                        |
| -- | ------------------------------------- | --------------------------------------------------------------------------------------- | 
| 1  | [SWIG](http://www.swig.org/exec.html) | Interface compiler that connects programs written in C and C++ with scripting languages | 
| 2  | [git](https://git-scm.com/)           | Distributed version control system                                                      |
| 3  | [python3-dev](https://packages.debian.org/stable/python3-dev)| Header files and a static library for Python                     |
| 4  | [build-essential](https://packages.ubuntu.com/bionic/build-essential)| Informational list of build-essential packages           |
| 5  | [libpulse-dev](https://packages.ubuntu.com/bionic/libpulse-dev)| PulseAudio client development headers and libraries            |
| 6  | [libasound2-dev](https://packages.ubuntu.com/bionic/libasound2-dev)| Shared library for ALSA applications - development files   |
| 7  | [software-properties-common](https://packages.ubuntu.com/bionic/software-properties-common)| Manage the repositories that you install software from (common)|
| 8 | [apt-utils](https://packages.ubuntu.com/bionic/apt-utils)| Package management related utility programs                          |
| 9 | [wget](https://packages.ubuntu.com/bionic/wget)| Retrieves files from the web                                                   |
| 10 | [python3-pip](https://packages.ubuntu.com/bionic/python3-pip)| Python package installer                                         |

### List of Python 3.7 packages

**Note:** the list is not final and still under review. The latest version of requirements.txt file is [here](https://github.com/ikostan/ubuntu_python_3.7_selenium/blob/master/requirements.txt).

| #  | Package                               |                                      Description                                        |
| -- | ------------------------------------- | --------------------------------------------------------------------------------------- | 
| 1  | [allure-pytest](https://pypi.org/project/allure-pytest/)| Allure Pytest Plugin                                                  |
| 2  | [allure-python-commons](https://github.com/allure-framework/allure-python)| Common engine for all/custom modules                |
| 3  | [appdirs](https://pypi.org/project/appdirs/)| Helps to choose directory for your app in order to sort user data                 |
| 4  | [atomicwrites](https://pypi.org/project/atomicwrites/)| Atomic file writes                                                      |
| 5  | [attrs](https://pypi.org/project/attrs/)| Helps you to write concise and correct software without slowing down your code        |
| 6  | [audioread](https://pypi.org/project/audioread/)| Decode audio files using whichever backend is available                       |
| 7  | [backcall](https://pypi.org/project/backcall/)| Specifications for callback functions passed in to an API                       |
| 8  | [certifi](https://pypi.org/project/certifi/)| Collection of Root Certificates for validating the trustworthiness of SSL certificates while verifying the identity of TLS hosts |
| 9  | [cffi](https://pypi.org/project/cffi/)| Foreign Function Interface for Python calling C code                                    |
| 10 | [chardet](https://pypi.org/project/chardet2/)| Detects various encoding formats |
| 11 | [codecov](https://codecov.io/)| Codecov provides highly integrated tools to group, merge, archive, and compare coverage reports |
| 12 | [colorama](https://pypi.org/project/colorama/)| Makes ANSI escape character sequences (for producing colored terminal text and cursor positioning) work under MS Windows |
| 13 | [configparser](https://pypi.org/project/configparser2/)| configparser2 is derived from Lukasz Langa's configparser mercurial repo. The only difference is a name is not conflicting with the default python3 configparser                                           |
| 14 | [coverage](https://pypi.org/project/coverage/)| Coverage.py measures code coverage, typically during test execution             |
| 15 | [crayons](https://pypi.org/project/crayons/)| Gives you colored strings for terminal usage                                      |
| 16 | [cycler](https://pypi.org/project/Cycler/)| The public API of cycler consists of a class Cycler, a factory function cycler(), and a concatenation function concat() |
| -- | []()|                                        |                                       |
| -- | [pocketsphinx](https://packages.ubuntu.com/bionic/pocketsphinx)| Speech recognition tool                                        |
| -- | [ipython](https://pypi.org/project/ipython/)| Provides a toolkit to help you make the most out of using Python interactively    |
| -- | [python-pytest-cov](https://packages.ubuntu.com/bionic/python-pytest-cov)| py.test plugin to produce coverage reports           |

Aditional resources:

- [GitHub](https://github.com/ikostan/ubuntu_python_3.7_selenium/)
- [Docker](https://hub.docker.com/repository/docker/ikostan/ubuntu_python_3.7_selenium)
