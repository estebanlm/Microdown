Class {
	#name : #MicPictureBasedWriter,
	#superclass : #Object,
	#instVars : [
		'placeOfTemplateFolder',
		'sourceSlideImagesFolder',
		'slideNames'
	],
	#category : #'Microdown-H5P'
}

{ #category : #examples }
MicPictureBasedWriter class >> example [
	<script>
	
	self new
		placeOfTemplateFolder: '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/AdvancedOODesign/h5p/pharo-Template-withVariableNames2/';
		sourceFolder: '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/AdvancedOODesign/h5p/AboutBasket-images/';
		writeContentJSONOnDisk: 2.
		
]

{ #category : #accessing }
MicPictureBasedWriter >> contentJSON [
	"I point to the place in the source where the content.json should be located."
	
	^ (self target / 'content' / 'content.json') asFileReference
]

{ #category : #writing }
MicPictureBasedWriter >> copyImagesInSource [

	self sourceSlideImagesFolder copyAllTo: self target / 'content' / 'images'
]

{ #category : #writing }
MicPictureBasedWriter >> go [
	
	self installSource.
	self copyImagesInSource.
	slideNames := self sourceSlideImagesFolder allFilesWithExtension: 'jpeg'.
	self generateContent.
]

{ #category : #writing }
MicPictureBasedWriter >> installSource [
	
	self placeOfTemplateFolder copyAllTo: self target
]

{ #category : #accessing }
MicPictureBasedWriter >> placeOfTemplateFolder [

	^ placeOfTemplateFolder ifNil: [ 
		placeOfTemplateFolder := '/Users/ducasse/Workspace/FirstCircle/MyBooks/Bk-Writing/AdvancedOODesign/h5p/Source-Template/' asFileReference ]
]

{ #category : #accessing }
MicPictureBasedWriter >> placeOfTemplateFolder: aString [

	placeOfTemplateFolder := aString asFileReference 
]

{ #category : #'no template' }
MicPictureBasedWriter >> presentationRawString [
	"STONJSON fromString: self new presentationRawString"
	^ '{"presentation":{"slides":[{"elements":[{"x":0,"y":0,"width":99.99999999999999,"height":100,"action":{"library":"H5P.Image 1.1","params":{"contentName":"Image","file":{"path":"images/image-OE0PKFVx.png","mime":"image/png","copyright":{"license":"U"},"width":310,"height":330}},"subContentId":"5fb6da95-df20-4df0-9de2-aa006c01c08e","metadata":{"contentType":"Image","license":"U","title":"Untitled Image","authors":[],"changes":[]}},"alwaysDisplayComments":false,"backgroundOpacity":0,"displayAsButton":false,"buttonSize":"big","goToSlideType":"specified","invisible":false,"solution":""}],"slideBackgroundSelector":{},"keywords":[{"main":"Nice code eh!"}]}],"keywordListEnabled":true,"globalBackgroundSelector":{},"keywordListAlwaysShow":false,"keywordListAutoHide":false,"keywordListOpacity":100},"override":{"activeSurface":false,"hideSummarySlide":false,"summarySlideSolutionButton":true,"summarySlideRetryButton":true,"enablePrintButton":false,"social":{"showFacebookShare":false,"facebookShare":{"url":"@currentpageurl","quote":"I scored @score out of @maxScore on a task at @currentpageurl."},"showTwitterShare":false,"twitterShare":{"statement":"I scored @score out of @maxScore on a task at @currentpageurl.","url":"@currentpageurl","hashtags":"h5p, course"},"showGoogleShare":false,"googleShareUrl":"@currentpageurl"}},"l10n":{"slide":"Slide","score":"Score","yourScore":"Your Score","maxScore":"Max Score","total":"Total","totalScore":"Total Score","showSolutions":"Show solutions","retry":"Retry","exportAnswers":"Export text","hideKeywords":"Hide sidebar navigation menu","showKeywords":"Show sidebar navigation menu","fullscreen":"Fullscreen","exitFullscreen":"Exit fullscreen","prevSlide":"Previous slide","nextSlide":"Next slide","currentSlide":"Current slide","lastSlide":"Last slide","solutionModeTitle":"Exit solution mode","solutionModeText":"Solution Mode","summaryMultipleTaskText":"Multiple tasks","scoreMessage":"You achieved:","shareFacebook":"Share on Facebook","shareTwitter":"Share on Twitter","shareGoogle":"Share on Google+","summary":"Summary","solutionsButtonTitle":"Show comments","printTitle":"Print","printIngress":"How would you like to print this presentation?","printAllSlides":"Print all slides","printCurrentSlide":"Print current slide","noTitle":"No title","accessibilitySlideNavigationExplanation":"Use left and right arrow to change slide in that direction whenever canvas is selected.","accessibilityCanvasLabel":"Presentation canvas. Use left and right arrow to move between slides.","containsNotCompleted":"@slideName contains not completed interaction","containsCompleted":"@slideName contains completed interaction","slideCount":"Slide @index of @total","containsOnlyCorrect":"@slideName only has correct answers","containsIncorrectAnswers":"@slideName has incorrect answers","shareResult":"Share Result","accessibilityTotalScore":"You got @score of @maxScore points in total","accessibilityEnteredFullscreen":"Entered fullscreen","accessibilityExitedFullscreen":"Exited fullscreen","confirmDialogHeader":"Submit your answers","confirmDialogText":"This will submit your results, do you want to continue?","confirmDialogConfirmText":"Submit and see results"}}'
]

{ #category : #writing }
MicPictureBasedWriter >> presentationString2 [
	"STONJSON fromString: self new presentationString2"
	
	^ '{"presentation":{"slides":[', (self slideStringFor: 'foo.png'), '],"keywordListEnabled":true,"globalBackgroundSelector":{},"keywordListAlwaysShow":false,"keywordListAutoHide":false,"keywordListOpacity":100},"override":{"activeSurface":false,"hideSummarySlide":false,"summarySlideSolutionButton":true,"summarySlideRetryButton":true,"enablePrintButton":false,"social":{"showFacebookShare":false,"facebookShare":{"url":"@currentpageurl","quote":"I scored @score out of @maxScore on a task at @currentpageurl."},"showTwitterShare":false,"twitterShare":{"statement":"I scored @score out of @maxScore on a task at @currentpageurl.","url":"@currentpageurl","hashtags":"h5p, course"},"showGoogleShare":false,"googleShareUrl":"@currentpageurl"}},"l10n":{"slide":"Slide","score":"Score","yourScore":"Your Score","maxScore":"Max Score","total":"Total","totalScore":"Total Score","showSolutions":"Show solutions","retry":"Retry","exportAnswers":"Export text","hideKeywords":"Hide sidebar navigation menu","showKeywords":"Show sidebar navigation menu","fullscreen":"Fullscreen","exitFullscreen":"Exit fullscreen","prevSlide":"Previous slide","nextSlide":"Next slide","currentSlide":"Current slide","lastSlide":"Last slide","solutionModeTitle":"Exit solution mode","solutionModeText":"Solution Mode","summaryMultipleTaskText":"Multiple tasks","scoreMessage":"You achieved:","shareFacebook":"Share on Facebook","shareTwitter":"Share on Twitter","shareGoogle":"Share on Google+","summary":"Summary","solutionsButtonTitle":"Show comments","printTitle":"Print","printIngress":"How would you like to print this presentation?","printAllSlides":"Print all slides","printCurrentSlide":"Print current slide","noTitle":"No title","accessibilitySlideNavigationExplanation":"Use left and right arrow to change slide in that direction whenever canvas is selected.","accessibilityCanvasLabel":"Presentation canvas. Use left and right arrow to move between slides.","containsNotCompleted":"@slideName contains not completed interaction","containsCompleted":"@slideName contains completed interaction","slideCount":"Slide @index of @total","containsOnlyCorrect":"@slideName only has correct answers","containsIncorrectAnswers":"@slideName has incorrect answers","shareResult":"Share Result","accessibilityTotalScore":"You got @score of @maxScore points in total","accessibilityEnteredFullscreen":"Entered fullscreen","accessibilityExitedFullscreen":"Exited fullscreen","confirmDialogHeader":"Submit your answers","confirmDialogText":"This will submit your results, do you want to continue?","confirmDialogConfirmText":"Submit and see results"}}'
]

{ #category : #writing }
MicPictureBasedWriter >> presentationString3 [
	"STONJSON fromString: self new presentationString3"
	
	^ '{"presentation":{"slides":[', (self slideStringFor: '0001.jpg'), ',' , (self slideStringFor: 'foo.png'),  '],"keywordListEnabled":true,"globalBackgroundSelector":{},"keywordListAlwaysShow":false,"keywordListAutoHide":false,"keywordListOpacity":100},"override":{"activeSurface":false,"hideSummarySlide":false,"summarySlideSolutionButton":true,"summarySlideRetryButton":true,"enablePrintButton":false,"social":{"showFacebookShare":false,"facebookShare":{"url":"@currentpageurl","quote":"I scored @score out of @maxScore on a task at @currentpageurl."},"showTwitterShare":false,"twitterShare":{"statement":"I scored @score out of @maxScore on a task at @currentpageurl.","url":"@currentpageurl","hashtags":"h5p, course"},"showGoogleShare":false,"googleShareUrl":"@currentpageurl"}},"l10n":{"slide":"Slide","score":"Score","yourScore":"Your Score","maxScore":"Max Score","total":"Total","totalScore":"Total Score","showSolutions":"Show solutions","retry":"Retry","exportAnswers":"Export text","hideKeywords":"Hide sidebar navigation menu","showKeywords":"Show sidebar navigation menu","fullscreen":"Fullscreen","exitFullscreen":"Exit fullscreen","prevSlide":"Previous slide","nextSlide":"Next slide","currentSlide":"Current slide","lastSlide":"Last slide","solutionModeTitle":"Exit solution mode","solutionModeText":"Solution Mode","summaryMultipleTaskText":"Multiple tasks","scoreMessage":"You achieved:","shareFacebook":"Share on Facebook","shareTwitter":"Share on Twitter","shareGoogle":"Share on Google+","summary":"Summary","solutionsButtonTitle":"Show comments","printTitle":"Print","printIngress":"How would you like to print this presentation?","printAllSlides":"Print all slides","printCurrentSlide":"Print current slide","noTitle":"No title","accessibilitySlideNavigationExplanation":"Use left and right arrow to change slide in that direction whenever canvas is selected.","accessibilityCanvasLabel":"Presentation canvas. Use left and right arrow to move between slides.","containsNotCompleted":"@slideName contains not completed interaction","containsCompleted":"@slideName contains completed interaction","slideCount":"Slide @index of @total","containsOnlyCorrect":"@slideName only has correct answers","containsIncorrectAnswers":"@slideName has incorrect answers","shareResult":"Share Result","accessibilityTotalScore":"You got @score of @maxScore points in total","accessibilityEnteredFullscreen":"Entered fullscreen","accessibilityExitedFullscreen":"Exited fullscreen","confirmDialogHeader":"Submit your answers","confirmDialogText":"This will submit your results, do you want to continue?","confirmDialogConfirmText":"Submit and see results"}}'
]

{ #category : #writing }
MicPictureBasedWriter >> presentationString4 [
	"STONJSON fromString: self new presentationString4"
	
	^ '{"presentation":{"slides":[', (self slidesStringForCollection: #('0001.jpg' 'foo.png' '0001.jpg')),  '],"keywordListEnabled":true,"globalBackgroundSelector":{},"keywordListAlwaysShow":false,"keywordListAutoHide":false,"keywordListOpacity":100},"override":{"activeSurface":false,"hideSummarySlide":false,"summarySlideSolutionButton":true,"summarySlideRetryButton":true,"enablePrintButton":false,"social":{"showFacebookShare":false,"facebookShare":{"url":"@currentpageurl","quote":"I scored @score out of @maxScore on a task at @currentpageurl."},"showTwitterShare":false,"twitterShare":{"statement":"I scored @score out of @maxScore on a task at @currentpageurl.","url":"@currentpageurl","hashtags":"h5p, course"},"showGoogleShare":false,"googleShareUrl":"@currentpageurl"}},"l10n":{"slide":"Slide","score":"Score","yourScore":"Your Score","maxScore":"Max Score","total":"Total","totalScore":"Total Score","showSolutions":"Show solutions","retry":"Retry","exportAnswers":"Export text","hideKeywords":"Hide sidebar navigation menu","showKeywords":"Show sidebar navigation menu","fullscreen":"Fullscreen","exitFullscreen":"Exit fullscreen","prevSlide":"Previous slide","nextSlide":"Next slide","currentSlide":"Current slide","lastSlide":"Last slide","solutionModeTitle":"Exit solution mode","solutionModeText":"Solution Mode","summaryMultipleTaskText":"Multiple tasks","scoreMessage":"You achieved:","shareFacebook":"Share on Facebook","shareTwitter":"Share on Twitter","shareGoogle":"Share on Google+","summary":"Summary","solutionsButtonTitle":"Show comments","printTitle":"Print","printIngress":"How would you like to print this presentation?","printAllSlides":"Print all slides","printCurrentSlide":"Print current slide","noTitle":"No title","accessibilitySlideNavigationExplanation":"Use left and right arrow to change slide in that direction whenever canvas is selected.","accessibilityCanvasLabel":"Presentation canvas. Use left and right arrow to move between slides.","containsNotCompleted":"@slideName contains not completed interaction","containsCompleted":"@slideName contains completed interaction","slideCount":"Slide @index of @total","containsOnlyCorrect":"@slideName only has correct answers","containsIncorrectAnswers":"@slideName has incorrect answers","shareResult":"Share Result","accessibilityTotalScore":"You got @score of @maxScore points in total","accessibilityEnteredFullscreen":"Entered fullscreen","accessibilityExitedFullscreen":"Exited fullscreen","confirmDialogHeader":"Submit your answers","confirmDialogText":"This will submit your results, do you want to continue?","confirmDialogConfirmText":"Submit and see results"}}'
]

{ #category : #writing }
MicPictureBasedWriter >> presentationStringForCollection: aCol [ 
	"STONJSON fromString: self new presentationString4"
	
	^ '{"presentation":{"slides":[', (self slidesStringForCollection: aCol),  '],"keywordListEnabled":true,"globalBackgroundSelector":{},"keywordListAlwaysShow":false,"keywordListAutoHide":false,"keywordListOpacity":100},"override":{"activeSurface":false,"hideSummarySlide":false,"summarySlideSolutionButton":true,"summarySlideRetryButton":true,"enablePrintButton":false,"social":{"showFacebookShare":false,"facebookShare":{"url":"@currentpageurl","quote":"I scored @score out of @maxScore on a task at @currentpageurl."},"showTwitterShare":false,"twitterShare":{"statement":"I scored @score out of @maxScore on a task at @currentpageurl.","url":"@currentpageurl","hashtags":"h5p, course"},"showGoogleShare":false,"googleShareUrl":"@currentpageurl"}},"l10n":{"slide":"Slide","score":"Score","yourScore":"Your Score","maxScore":"Max Score","total":"Total","totalScore":"Total Score","showSolutions":"Show solutions","retry":"Retry","exportAnswers":"Export text","hideKeywords":"Hide sidebar navigation menu","showKeywords":"Show sidebar navigation menu","fullscreen":"Fullscreen","exitFullscreen":"Exit fullscreen","prevSlide":"Previous slide","nextSlide":"Next slide","currentSlide":"Current slide","lastSlide":"Last slide","solutionModeTitle":"Exit solution mode","solutionModeText":"Solution Mode","summaryMultipleTaskText":"Multiple tasks","scoreMessage":"You achieved:","shareFacebook":"Share on Facebook","shareTwitter":"Share on Twitter","shareGoogle":"Share on Google+","summary":"Summary","solutionsButtonTitle":"Show comments","printTitle":"Print","printIngress":"How would you like to print this presentation?","printAllSlides":"Print all slides","printCurrentSlide":"Print current slide","noTitle":"No title","accessibilitySlideNavigationExplanation":"Use left and right arrow to change slide in that direction whenever canvas is selected.","accessibilityCanvasLabel":"Presentation canvas. Use left and right arrow to move between slides.","containsNotCompleted":"@slideName contains not completed interaction","containsCompleted":"@slideName contains completed interaction","slideCount":"Slide @index of @total","containsOnlyCorrect":"@slideName only has correct answers","containsIncorrectAnswers":"@slideName has incorrect answers","shareResult":"Share Result","accessibilityTotalScore":"You got @score of @maxScore points in total","accessibilityEnteredFullscreen":"Entered fullscreen","accessibilityExitedFullscreen":"Exited fullscreen","confirmDialogHeader":"Submit your answers","confirmDialogText":"This will submit your results, do you want to continue?","confirmDialogConfirmText":"Submit and see results"}}'
]

{ #category : #'no template' }
MicPictureBasedWriter >> slideString [
	"STONJSON fromString: self new slideString"
	^ '{"elements":[{"x":0,"y":0,"width":100,"height":100,"action":{"library":"H5P.Image 1.1","params":{"contentName":"Image","file":{"path":"images/image-OE0PKFVx.png","mime":"image/png","copyright":{"license":"U"},"width":310,"height":330}},"subContentId":"5fb6da95-df20-4df0-9de2-aa006c01c08e","metadata":{"contentType":"Image","license":"U","title":"Untitled Image","authors":[],"changes":[]}},"alwaysDisplayComments":false,"backgroundOpacity":0,"displayAsButton":false,"buttonSize":"big","goToSlideType":"specified","invisible":false,"solution":""}],"slideBackgroundSelector":{},"keywords":[{"main":"Nice code eh!"}]}'
]

{ #category : #writing }
MicPictureBasedWriter >> slideStringFor: aString [

	^ '{"elements":[{"x":0,"y":0,"width":100,"height":100,"action":{"library":"H5P.Image 1.1","params":{"contentName":"Image","file":{"path":"images/',aString,'","mime":"image/png","copyright":{"license":"U"},"width":310,"height":330}},"subContentId":"5fb6da95-df20-4df0-9de2-aa006c01c08e","metadata":{"contentType":"Image","license":"U","title":"Untitled Image","authors":[],"changes":[]}},"alwaysDisplayComments":false,"backgroundOpacity":0,"displayAsButton":false,"buttonSize":"big","goToSlideType":"specified","invisible":false,"solution":""}],"slideBackgroundSelector":{},"keywords":[{"main":"Nice code eh!"}]}'
]

{ #category : #writing }
MicPictureBasedWriter >> slidesStringForCollection: aCollection [

	^ String streamContents: [ :st | 
		aCollection 
			do: [ :each | st nextPutAll: (self slideStringFor: each)  ]
			separatedBy: [ st nextPutAll:',' ]
		 ]

]

{ #category : #accessing }
MicPictureBasedWriter >> sourceSlideImagesFolder [
	"I'm the place where the slides expressed in jpeg files are. The files in my repository will the copy in the target architecture 
	and used to generate the presentation in the content.json file."
	
	^ sourceSlideImagesFolder
]

{ #category : #accessing }
MicPictureBasedWriter >> sourceSlideImagesFolder: aString [

	sourceSlideImagesFolder := aString asFileReference
]

{ #category : #accessing }
MicPictureBasedWriter >> target [
	"self new target"
	^ self placeOfTemplateFolder parent / 'Target'
]

{ #category : #accessing }
MicPictureBasedWriter >> targetImageFolder [

	^ (self placeOfTemplateFolder / 'content' / 'images/') asFileReference
]

{ #category : #writing }
MicPictureBasedWriter >> writeContentJSONOnDisk: aMicDocument [
	"self new writeContentJSONOnDisk: 2"
	self contentJSON ensureDelete.
	self contentJSON 
		writeStreamDo: [ :str | str nextPutAll: (self presentationStringForCollection: #('0001.jpg' 'foo.png' '0001.jpg' 'foo.png'))]
]