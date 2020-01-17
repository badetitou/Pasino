Class {
	#name : #FileGroup,
	#superclass : #Object,
	#instVars : [
		'sourceImage',
		'targetImage',
		'sourcePath',
		'targetPath'
	],
	#category : #Pasino
}

{ #category : #accessing }
FileGroup >> gtSrcImageIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite morph
		  title: 'srcImage';
		  display: [ :anObject | self sourceImage ];
		  yourself
]

{ #category : #accessing }
FileGroup >> gtTargetImageIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite morph
		  title: 'targetImage';
		  display: [ :anObject | self targetImage ];
		  yourself
]

{ #category : #accessing }
FileGroup >> printOn: aStream [
	aStream nextPutAll: 'fileGroup (';
		nextPutAll: self sourcePath basenameWithoutExtension;
		nextPutAll: ' , ';
		nextPutAll: self targetPath basenameWithoutExtension;
		nextPut: $)
]

{ #category : #accessing }
FileGroup >> sourceImage [
	^ sourceImage ifNil: [ sourceImage := ImageMorph fromStream: self sourcePath binaryReadStream ]
]

{ #category : #accessing }
FileGroup >> sourceImage: anObject [
	sourceImage := anObject
]

{ #category : #accessing }
FileGroup >> sourcePath [
	^ sourcePath
]

{ #category : #accessing }
FileGroup >> sourcePath: anObject [
	sourcePath := anObject
]

{ #category : #accessing }
FileGroup >> targetImage [
	^ targetImage ifNil: [ targetImage := ImageMorph fromStream: self targetPath binaryReadStream ]
]

{ #category : #accessing }
FileGroup >> targetImage: anObject [
	targetImage := anObject
]

{ #category : #accessing }
FileGroup >> targetPath [
	^ targetPath
]

{ #category : #accessing }
FileGroup >> targetPath: anObject [
	targetPath := anObject
]
