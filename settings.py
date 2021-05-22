from os import environ, getcwd


def set_default_config():
    # appium config
    environ.setdefault(
        "ANDROID_PLATFORM", "Android")
    environ.setdefault(
        "ANDROID_VERSION", "8.0")
    environ.setdefault(
        "ANDROID_DEVICE_NAME", "192.168.56.109:5555")
    environ.setdefault("DEVICE_UDID", "")
    environ.setdefault("AUTO_ACCEPT_ALERTS", "true")

    # test runner config
    environ.setdefault(
        "ANDROID_APP", "{0}/application/{1}".format(getcwd(), "application.apk"))
    environ.setdefault(
        "RUNNER_URL", "http://localhost:4723/wd/hub")

