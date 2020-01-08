"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #BaselineOfPasino,
	#superclass : #BaselineOf,
	#category : #BaselineOfPasino
}

{ #category : #baselines }
BaselineOfPasino >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfPasino >> defineDependencies: spec [
  spec baseline: 'Parasol' with: [ spec
           loads: #('tests');
           repository: 'github://SeasideSt/Parasol/repository' ]
]

{ #category : #baselines }
BaselineOfPasino >> defineGroups: spec [
	
]

{ #category : #baselines }
BaselineOfPasino >> definePackages: spec [
  spec package: 'Pasino' with: [ spec requires: #('Parasol') ]
]
