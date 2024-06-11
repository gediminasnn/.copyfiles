# src/service/FilesContentService.py

from src.service.ReadFilesService import ReadFilesService
from src.copier.ClipboardCopier import ClipboardCopier

class FilesContentService:
    def __init__(self):
        self.readFilesService = ReadFilesService()
        self.clipboardCopier = ClipboardCopier()

    def readAndCopyFilesContent(self, fileTypes):
        fileContents = ""

        for fileType in fileTypes:
            fileContents += self.readFilesService.readNotExcludedFilesContent(fileType)

        # Read additional fixed files
        fileContents += self.readFilesService.readAdditionalFilesContent()

        # Append the additional text
        fileContents += self.readFilesService.readAppendTextContent()

        # Copy the content to the clipboard
        self.clipboardCopier.clip(fileContents)
