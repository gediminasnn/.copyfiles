import sys
from src.service.FilesContentService import FilesContentService

if __name__ == "__main__":
    try:
        service = FilesContentService()
        service.readAndCopyFilesContent(sys.argv[1:])
        print(f"Contents of all files with the specified extensions and additional files have been copied to clipboard. Appended custom text if provided.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
