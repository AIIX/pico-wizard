import os

from PySide2.QtCore import QUrl, Slot
from PySide2.QtQml import qmlRegisterType

from pico.module import Module


class Welcome(Module):
    def __init__(self, parent=None):
        super().__init__(__file__, parent)

    @staticmethod
    def registerTypes() -> None:
        qmlRegisterType(Welcome, 'PicoWizard', 1, 0, 'WelcomeModule')

    @staticmethod
    def qmlPath() -> QUrl:
        return QUrl(os.path.join(os.path.dirname(os.path.realpath(__file__)), "Welcome.qml"))

    @Slot(None, result=str)
    def moduleName(self) -> str:
        return "Welcome"
