Extension { #name : #FileReference }

{ #category : #'*Pasino' }
FileReference >> mimeTypes [
	"Return the possible mime types for the given path."
	^ filesystem mimeTypesAt: path
]
