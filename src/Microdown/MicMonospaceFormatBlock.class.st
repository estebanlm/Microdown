"
I represent a monospaced text section. I'm delimited using `\`` as in `\`monospace\`` to obtain `monospace`.
"
Class {
	#name : #MicMonospaceFormatBlock,
	#superclass : #MicFormatBlock,
	#category : #'Microdown-ModelInline'
}

{ #category : #testing }
MicMonospaceFormatBlock class >> isEvaluated [
	^ false
]

{ #category : #visiting }
MicMonospaceFormatBlock >> accept: aVisitor [
	^ aVisitor visitMonospace: self
]

{ #category : #operations }
MicMonospaceFormatBlock >> cleanSubstring [
	self substring: (MicInlineParser escapeReescape: self substring except: '`')
]

{ #category : #internal }
MicMonospaceFormatBlock >> closingDelimiter [

 	^ MonospaceMarkup
]

{ #category : #accessing }
MicMonospaceFormatBlock >> kind [
	^ #monospace
]

{ #category : #internal }
MicMonospaceFormatBlock >> openingDelimiter [

 	^ MonospaceMarkup
]
