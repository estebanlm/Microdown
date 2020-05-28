Class {
	#name : #BaselineOfMicrodown,
	#superclass : #BaselineOf,
	#category : #BaselineOfMicrodown
}

{ #category : #baselines }
BaselineOfMicrodown >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		spec 
			package: #'Microdown';
			package: #'Microdown-Tests'  with: [
				spec requires:  #( #'Microdown') ];
			
			package: #'Microdown-Pillar' with: [
				spec requires:  #( #'Microdown') ];
			package: #'Microdown-Pillar-Tests' with: [
				spec requires:  #(#'Microdown-Pillar' #'Microdown-Tests') ];
			
			package: #'Microdown-RichTextComposer' with: [
				spec requires:  #('Microdown') ]
			]

]