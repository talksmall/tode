accessing
editorNodeFor: anObject aspect: anAspect do: aBlock
  self
    editorNodeClassNameFor: anObject
    aspect: anAspect
    do: [ :className :finalAspect | 
      | editorClass |
      editorClass := TDTopezServer todeSymbolList
        objectNamed: className asSymbol.
      aBlock
        value:
          (editorClass new
            object: anObject;
            yourself)
        value: finalAspect ]