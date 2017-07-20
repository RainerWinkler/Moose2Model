writeFile
writeToStream: aStream
	| writer layoutFile |
	layoutFile := RWDiagramLayoutFile new.
	(writer := XMLWriter on: aStream)
		enablePrettyPrinting;
		xml;
		lineBreak: String crlf;
		comment: 'Moose Diagram Layout data, see "https://github.com/RainerWinkler/Moose-FAMIX-SAP-Extractor" on how to use this file'.
	writer tag
		name: #elements;
		with: [ elementGroup elementList
				do: [ :element | 
					element elementIsStored
						ifTrue: [ writer tag
								name: #element;
								with: [ layoutFile writeElement: element toXML: writer.
									layoutFile writeAttributeList: element attributeList toWriter: writer ] ] ] ]