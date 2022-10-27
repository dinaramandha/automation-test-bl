# robot framework-automation-test-example


## Requirements

- Python3
- Pip3
- Robot Framework
- Appium Desktop
- Uiautomatorviewer
- Adb (for android only)
- Genymotion (for mobile application only)
## Installation

- Install python3

```sh
python3 --version
sudo apt-get update
sudo apt-get install -y python3
sudo apt-get upgrade python3
```

- Install pip

```sh
pip3 -V
sudo apt-get update
sudo apt-get install -y python3-pip
sudo apt-get upgrade python3-pip
```

- Install robot framework

```sh
pip3 install robot-framework
robot --version
```

- [Install appium](https://github.com/appium/appium-desktop/releases/latest)

## How to Run

- Clone this repository
- Run test `python3 run.py --loglevel TRACE:INFO -d test-results xxx/xxx/xxx.robot`
