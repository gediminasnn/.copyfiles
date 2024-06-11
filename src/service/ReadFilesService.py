import os
from src.reader.FileReader import FileReader
from src.finder.FileFinder import FileFinder

class ReadFilesService:
    def __init__(self):
        self.baseDir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
        self.fileReader = FileReader()
        self.fileFinder = FileFinder()

    def readNotExcludedFilesContent(self, fileType):
        excludeFiles = self.fileReader.readLines(os.path.join(self.baseDir, 'exclude_files.txt'))
        fileContents = ""
        for root, _, files in os.walk('.'):
            for file in files:
                if file.endswith(fileType) and file not in excludeFiles:
                    fileContents += os.path.join(root, file) + '\n\n'
                    fileContents += self.fileReader.readFileContent(os.path.join(root, file))
        return fileContents

    def readAdditionalFilesContent(self):
        additionalFiles = self.fileReader.readLines(os.path.join(self.baseDir, 'additional_files.txt'))
        fileContents = ""
        for fixedFile in additionalFiles:
            filePath = self.fileFinder.find(fixedFile)
            fileContents += filePath + '\n\n'
            fileContents += self.fileReader.readFileContent(filePath)
        return fileContents

    def readAppendTextContent(self):
        return self.fileReader.readFileContent(os.path.join(self.baseDir, 'append_text.txt'))
