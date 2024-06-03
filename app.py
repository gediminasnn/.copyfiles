# app.py

import sys
from src.service.FilesContentService import FilesContentService

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python app.py <file_extension>")
        sys.exit(1)
    
    try:
        service = FilesContentService()
        service.readAndCopyFilesContent(sys.argv[1])
        print("Contents of all files with the extension '{}' have been copied to clipboard. Appended custom text if provided.".format(sys.argv[1]))
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
