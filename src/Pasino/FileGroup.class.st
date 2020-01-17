Class {
	#name : #FileGroup,
	#superclass : #Object,
	#instVars : [
		'sourceImage',
		'targetImage'
	],
	#category : #Pasino
}

{ #category : #accessing }
FileGroup >> gtSrcImageIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite morph
		  title: 'srcImage';
		  display: [ :anObject | 
			  ImageMorph fromStream: self sourceImage binaryReadStream ];
		  yourself
]

{ #category : #accessing }
FileGroup >> gtTargetImageIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite morph
		  title: 'targetImage';
		  display: [ :anObject | 
			  ImageMorph fromStream: self targetImage binaryReadStream ];
		  yourself
]

{ #category : #accessing }
FileGroup >> printOn: aStream [
	aStream nextPutAll: 'fileGroup (';
		nextPutAll: self sourceImage basenameWithoutExtension;
		nextPutAll: ' , ';
		nextPutAll: self targetImage basenameWithoutExtension;
		nextPut: $)
]

{ #category : #accessing }
FileGroup >> sourceImage [
	^ sourceImage
]

{ #category : #accessing }
FileGroup >> sourceImage: anObject [
	sourceImage := anObject
]

{ #category : #accessing }
FileGroup >> targetImage [
	^ targetImage
]

{ #category : #accessing }
FileGroup >> targetImage: anObject [
	targetImage := anObject
]
