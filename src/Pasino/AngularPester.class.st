"
Metacello new
    baseline: 'Parasol';
    repository: 'github://SeasideSt/Parasol/repository';
    load: 'tests'.
(Smalltalk at: #ZnZincServerAdaptor) startOn: 8080.

""Open a web browser on the English-language Wikipedia home page.""
driver := BPRemoteWebDriver withCapabilities: BPChromeOptions new.
driver get: 'http://en.wikipedia.org/'.


driver executeScript: '
var sheet = document.createElement(""style"");
sheet.innerHTML = ""* {      color: transparent !important;      background-color: transparent !important;      background-image: none !important;      border-color: black !important;  }    img {       visibility:hidden  }    input, button,i, bl-desktop-phase-home-tab-header, bl-desktop-phase-tab-header,span {       visibility:hidden  }      select {       visibility:hidden  }    bl-fieldset {           box-shadow: 1px 2px 1px  transparent!important;  }    fieldset {        box-shadow: 1px 2px 1px  transparent !important;  margin-left: 0px !important;  padding-left: 0px !important;  }    fieldset>.card-body {   background: rgba(0,0,0, 0.5) !important;  }    legend {   background: rgba(0,0,0, 0.5) !important;      box-shadow: 1px 0px 0px  transparent!important;  }      .BLFieldSetPanel>tbody>tr:nth-child(1)>.BLFieldSetPanel-border-hori ,.BLFieldSetPanel-content,  .gwt-DisclosurePanel>tbody>tr {     background: rgba(0,0,0, 0.5) !important;  }    table.BLFieldSetPanel, table.gwt-DisclosurePanel  {      margin-top: 0px;      padding-top: 5px;  }"";
document.body.appendChild(sheet);
' with: {}.

""Click on the search box and type in 'Pharo' followed by a press of the Return key.""
(driver findElementByID: 'searchInput') click.
driver getKeyboard sendKeys: ('Pharo' , (String with: BPKeys return)).

""Get the text of the article's first paragraph and show it on the transcript.""
Transcript show: ((driver findElementByID: 'mw-content-text') findElementByCSSSelector: 'p:not(.mw-empty-elt)') getText.

""Tell the browser to quit.""
driver quit.
"
Class {
	#name : #AngularPester,
	#superclass : #Pester,
	#category : #Pasino
}

{ #category : #accessing }
AngularPester >> crawlPage: aPageName [
	(driver findElementByID: 'quickAccess') click.
	driver getKeyboard sendKeys: (aPageName , (String with: BPKeys return)).
]

{ #category : #accessing }
AngularPester >> url [
	^ 'http://localhost:4200'
]
