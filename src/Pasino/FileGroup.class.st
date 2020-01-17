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
