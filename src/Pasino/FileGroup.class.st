Class {
	#name : #FileGroup,
	#superclass : #Object,
	#instVars : [
		'sourceImage',
		'targetImage',
		'sourcePath',
		'targetPath',
		'diffCache',
		'diffPercentageCache'
	],
	#category : #Pasino
}

{ #category : #accessing }
FileGroup >> diff [
	^ diffCache ifNil: [ 
		  diffCache := self targetImage image bits asOrderedCollection
			               with: self sourceImage image bits
			               collect: [ :a :b | a - b ] ]
]

{ #category : #accessing }
FileGroup >> diffPercentage [
	^ diffPercentageCache ifNil: [ 
		  diffPercentageCache := [ 
		                         ((self diff count: [ :a | a ~= 0 ])
		                          /
		                          self sourceImage image bits
			                          asOrderedCollection size * 100) asFloat ]
			                         on: Exception
			                         do: [ -1 ] ]
]

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
FileGroup >> resetAllCache [
	self resetCache.
	targetImage := nil.
	sourceImage := nil
]

{ #category : #accessing }
FileGroup >> resetCache [
	diffPercentageCache := nil.
	diffCache := nil
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
