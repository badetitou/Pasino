Extension { #name : #FileSystemStore }

{ #category : #'*Pasino' }
FileSystemStore >> mimeTypesAt: aPath [
	| mimeType |
	mimeType := ZnMimeType 
						forFilenameExtension: aPath extension 
						ifAbsent: [  ^ nil ].
	^ Array with: mimeType
]
