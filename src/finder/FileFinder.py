import os

class FileFinder:
    def find(self, filename):
        file_path = next((os.path.join(root, file) for root, _, files in os.walk('.') for file in files if file == filename), None)
        if file_path is None:
            raise FileNotFoundError(f"The file {filename} does not exist.")
        return file_path
