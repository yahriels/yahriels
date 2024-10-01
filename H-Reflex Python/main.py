# import sys
import sys


# Import UI File (assuming interface.py has a class Ui_MainWindow)
from interface import * 

# Create main window
class MainWindow(QMainWindow):
    def __init__(self, parent=None):
        QMainWindow.__init__(self)
        
        self.ui - Ui_MainWindow()
        self.ui.setupUi(self)
        
        self.show()
        
        
# Execute File
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec())