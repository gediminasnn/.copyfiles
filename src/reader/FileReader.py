import os

class FileReader:
    def readFileContent(self, filePath):
        if not os.path.isfile(filePath):
            print(f"The file {filePath} does not exist.")
            return ''
        with open(filePath, 'r') as file:
            return file.read() + '\n'

    def readLines(self, filePath):
        if not os.path.isfile(filePath):
            print(f"The file {filePath} does not exist.")
            return []
        files = []
        with open(filePath, 'r') as file:
            for line in file:
                files.append(line.strip())
        return files
