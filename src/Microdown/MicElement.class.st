Class {
	#name : #MicElement,
	#superclass : #Object,
	#instVars : [
		'parent',
		'properties'
	],
	#pools : [
		'MicMicrodownSharedPool'
	],
	#category : #'Microdown-Model'
}

{ #category : #utilities }
MicElement class >> extensionClassFor: tag [
	"I am a utility method used in extension blocks to find the right subclass to instantiate"
	^ self subclasses detect: [ :each | each tag = tag ] ifNone: [ self ]
]

{ #category : #properties }
MicElement >> hasProperty: aKey [
	"Answer whether there is a property named aKey."
	
	properties ifNil: [ ^ false ].
	^ properties includesKey: aKey
]

{ #category : #public }
MicElement >> inlineParse: aString [
	| inlineParser inlinedChildren |
	
	inlineParser := self newInlineParser.
	inlinedChildren := inlineParser parse: aString.
	inlinedChildren do: [ :each | each parent: self ].
	
	^ inlinedChildren

]

{ #category : #private }
MicElement >> inlineParserClass [

	^ MicInlineParser
]

{ #category : #private }
MicElement >> newInlineParser [

	^ self inlineParserClass new
]

{ #category : #accessing }
MicElement >> parent [
	^ parent
]

{ #category : #accessing }
MicElement >> parent: aBlock [
	parent := aBlock.
	aBlock addChild: self
]

{ #category : #properties }
MicElement >> properties [
	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #properties }
MicElement >> propertiesCopy [
	self properties ifNil: [ ^ nil ].
	^ self properties collect: [ :each | each copy ]
]

{ #category : #properties }
MicElement >> propertyAt: aKey [
	"Answer the property value associated with aKey."
	
	^ self propertyAt: aKey ifAbsent: [ MicPropertyError signal: 'Property not found' ]
]

{ #category : #properties }
MicElement >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	^ self properties isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ self properties at: aKey ifAbsent: aBlock ]
]

{ #category : #properties }
MicElement >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self propertyAt: aKey ifAbsent: [ self propertyAt: aKey put: aBlock value ]
]

{ #category : #properties }
MicElement >> propertyAt: aKey put: anObject [
	"Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ self properties at: aKey put: anObject
]

{ #category : #properties }
MicElement >> removeProperty: aKey [
	"Remove the property with aKey. Answer the property or raise an error if aKey isn't found."
	
	^ self removeProperty: aKey ifAbsent: [ MicPropertyError signal: 'Property not found' ]
]

{ #category : #properties }
MicElement >> removeProperty: aKey ifAbsent: aBlock [
	"Remove the property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	self properties ifNil: [ ^ aBlock value ].
	answer := self properties removeKey: aKey ifAbsent: aBlock.
	self properties isEmpty ifTrue: [ properties := nil ].
	^ answer
]

{ #category : #public }
MicElement >> resolveFrom: aBase [
	Microdown resolveDocument: self withBase: aBase
]
