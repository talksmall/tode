as yet unclassified
break
  "
    db break @<step-point> <class>[ class]>><selector> 
    db break clear [break-list-index] 
    db break enable [break-list-index] 
    db break disable [break-list-index]  
    db break list 
    db break steps <class> [class] >> <selector>
    db break steps <class>[ class]>><selector>
"

  | breakTokens command |
  breakTokens := tokens copyFrom: 2 to: tokens size.
  command := breakTokens at: 1.
  (command beginsWith: '@')
    ifTrue: [ ^ self breakSet: breakTokens ].
  command = 'clear'
    ifTrue: [ ^ self breakClear: breakTokens ].
  command = 'enable'
    ifTrue: [ ^ self breakEnable: breakTokens ].
  command = 'disable'
    ifTrue: [ ^ self breakDisable: breakTokens ].
  command = 'list'
    ifTrue: [ ^ self breakList: breakTokens ].
  command = 'steps'
    ifTrue: [ ^ self breakSteps: breakTokens ]