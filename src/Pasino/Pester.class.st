Class {
	#name : #Pester,
	#superclass : #Object,
	#instVars : [
		'pagesName',
		'driver'
	],
	#category : #Pasino
}

{ #category : #'instance creation' }
Pester class >> fromPagesName: names [
	^ self new
		  pagesName: names;
		  yourself
]

{ #category : #accessing }
Pester >> applyCss [
	self driver
		executeScript: '
var sheet = document.createElement("style");
sheet.id = "furry";
sheet.innerHTML = "' , self cssBlinder , '";
document.body.appendChild(sheet);
'
		with: {  }
]

{ #category : #accessing }
Pester >> crawlPage: aPageName [
	"navigate to the page PageName"
	self subclassResponsibility 
]

{ #category : #accessing }
Pester >> crawlPageAndScreenshot: pageName [
	self crawlPage: pageName.
	self screenshotAndSave: pageName.
	self quitPage: pageName.
]

{ #category : #accessing }
Pester >> cssBlinder [
	^ '* {      color: transparent !important;      background-color: transparent !important;      background-image: none !important;      border-color: black !important;  }    img {       visibility:hidden  }    input, button,i, bl-desktop-phase-home-tab-header, bl-desktop-phase-tab-header,span {       visibility:hidden  }      select {       visibility:hidden  }    bl-fieldset {           box-shadow: 1px 2px 1px  transparent!important;  }    fieldset {        box-shadow: 1px 2px 1px  transparent !important;  margin-left: 0px !important;  padding-left: 0px !important;  }    fieldset>.card-body {   background: rgba(0,0,0, 0.5) !important;  }    legend {   background: rgba(0,0,0, 0.5) !important;      box-shadow: 1px 0px 0px  transparent!important;  }      .BLFieldSetPanel>tbody>tr:nth-child(1)>.BLFieldSetPanel-border-hori ,.BLFieldSetPanel-content,  .gwt-DisclosurePanel>tbody>tr {     background: rgba(0,0,0, 0.5) !important;  }    table.BLFieldSetPanel, table.gwt-DisclosurePanel  {      margin-top: 0px;      padding-top: 5px;  }'
]

{ #category : #accessing }
Pester >> do [
	self init.
	[ 
	self getPage.
	self pagesName do: [ :pageName | 
		self crawlPageAndScreenshot: pageName ] 
	] ensure: [ self quit ]
]

{ #category : #accessing }
Pester >> driver [
	^ driver
]

{ #category : #accessing }
Pester >> driver: anObject [
	driver := anObject
]

{ #category : #accessing }
Pester >> getPage [
	self driver get: self url
]

{ #category : #accessing }
Pester >> init [
	self driver: (BPRemoteWebDriver withCapabilities: BPChromeOptions new)
]

{ #category : #accessing }
Pester >> pagesName [
	^ pagesName
]

{ #category : #accessing }
Pester >> pagesName: anObject [
	pagesName := anObject
]

{ #category : #accessing }
Pester >> quit [
	self driver quit
]

{ #category : #accessing }
Pester >> quitPage: pageName [
	"can be extended"
]

{ #category : #accessing }
Pester >> screenshotAndSave: filename [
	1 seconds wait.
	self applyCss.
	1 seconds wait.
	PNGReadWriter
		putForm:
		(Form fromBinaryStream: driver getScreenshotAsByteArray readStream)
		onFileNamed: filename , '.png'.
	self driver
		executeScript: 'document.getElementById("furry").remove();'
		with: {  }
]

{ #category : #accessing }
Pester >> url [
	^ self subclassResponsibility
]
