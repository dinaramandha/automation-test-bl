from robot import run_cli
from settings import set_default_config
import os
import sys

# Allows running as a script. __name__ check needed with multiprocessing:
# https://github.com/robotframework/robotframework/issues/1137
if 'robot' not in sys.modules and __name__ == '__main__':
    import pythonpathsetter


if __name__ == '__main__':
    os.environ.setdefault("WORKDIR", os.getcwd())
    set_default_config()
    run_cli(sys.argv[1:])