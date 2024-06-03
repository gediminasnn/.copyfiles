# src/copier/clipboardCopier.py

import subprocess
import platform

class ClipboardCopier:
    def clip(self, content):
        if platform.system() == "Darwin":  # Check if the system is macOS
            self.clip_macos(content)
        else:
            self.clip_linux(content)

    def clip_linux(self, content):
        process = subprocess.Popen(['xclip', '-selection', 'clipboard'], stdin=subprocess.PIPE)
        process.communicate(input=content.encode())

    def clip_macos(self, content):
        process = subprocess.Popen(['pbcopy'], stdin=subprocess.PIPE)
        process.communicate(input=content.encode())
