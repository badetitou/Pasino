Class {
	#name : #FileGrouper,
	#superclass : #Object,
	#instVars : [
		'pages',
		'srcFolder',
		'targetFolder'
	],
	#category : #Pasino
}

{ #category : #accessing }
FileGrouper >> getSrcImageOf: page [
	^ (self srcFolder / page shortcut , 'png') exists
		  ifTrue: [ self srcFolder / page shortcut ,'png' ]
		  ifFalse: [ nil ]
]

{ #category : #accessing }
FileGrouper >> getTargetImageOf: page [
	^ (self targetFolder / page name , 'png') exists
		  ifTrue: [ self targetFolder / page name , 'png' ]
		  ifFalse: [ nil ]
]

{ #category : #accessing }
FileGrouper >> group [
	^ self pages
		  collect: [ :page | 
			  FileGroup new
				  sourceImage: (self getSrcImageOf: page);
				  targetImage: (self getTargetImageOf: page);
				  yourself ]
		  as: OrderedCollection
]

{ #category : #accessing }
FileGrouper >> initialize [
	super initialize.
	srcFolder := FileSystem workingDirectory.
	targetFolder := FileSystem workingDirectory
]

{ #category : #accessing }
FileGrouper >> pages [
	^ pages
]

{ #category : #accessing }
FileGrouper >> pages: anObject [
	pages := anObject
]

{ #category : #accessing }
FileGrouper >> srcFolder [
	^ srcFolder
]

{ #category : #accessing }
FileGrouper >> srcFolder: anObject [
	srcFolder := anObject
]

{ #category : #accessing }
FileGrouper >> targetFolder [
	^ targetFolder
]

{ #category : #accessing }
FileGrouper >> targetFolder: anObject [
	targetFolder := anObject
]
