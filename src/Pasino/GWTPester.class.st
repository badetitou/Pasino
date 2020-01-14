Class {
	#name : #GWTPester,
	#superclass : #Pester,
	#category : #Pasino
}

{ #category : #accessing }
GWTPester >> crawlPage: aPageName [
	(self driver findElementByID: 'gwt-debug-root-body___-ws_2-BLVerticalPanel-TabDeskPanel_2-BLDeckPanel-BLPhaseMainBar_2-BLSuggestBox4QS')
		clear;
		click.
	self driver getKeyboard sendKeys: aPageName , (String with: BPKeys return)
]

{ #category : #accessing }
GWTPester >> getPage [
	self driver get: self url.
	"login"
	(self driver findElementByID: 'j_username')
		click.
	self driver getKeyboard sendKeys: 'a'.
	(self driver findElementByName: 'j_password')
		click.
	self driver getKeyboard sendKeys: 'a'.
	(self driver findElementByID: 'submitConnect')
		click.
	2 second wait.
	
]

{ #category : #accessing }
GWTPester >> quitPage: aPageName [
	([self driver findElementByID: 'gwt-debug-root-body___-ws_2-BLVerticalPanel-TabDeskPanel_1-TabDeskBar-DIV_4-DIV_1-BLImageButton'] on: BPNoSuchElementException do: [ ^ nil ])
		click
]

{ #category : #accessing }
GWTPester >> url [
	^ 'http://ap15mogbl:8080/Web_coreincubator/Login.jsp'
]
