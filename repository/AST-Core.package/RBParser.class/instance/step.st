private
step
	(currentToken notNil and: [currentToken comments notNil]) 
		ifTrue: [comments addAll: currentToken comments].
	nextToken notNil 
		ifTrue: 
			[currentToken := nextToken.
			nextToken := nil]
		ifFalse: [currentToken := scanner next]