# import sys
import sys

# Import UI File
from interface import *

# create main window
class MainWindow(QMainWindow):
    def __init__(self, parent=None):
            QMainWindow.__init__(self)
            
            self.ui = Ui_MainWindow()
            self.ui.setupUI(self)
            
            self.show()
            
# execute file

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())