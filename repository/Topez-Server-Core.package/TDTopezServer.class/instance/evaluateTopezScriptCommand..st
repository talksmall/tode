accessing
evaluateTopezScriptCommand: line
  | tokens result |
  (line notEmpty and: [ line first = $# ])
    ifFalse: [ 
      tokens := line trimBoth findTokens: {(Character space)}.
      tokens isEmpty
        ifFalse: [ 
          | commandResult |
          commandResult := self evaluateTokens: tokens objIn: objIn value.
          result := commandResult resultObject ] ].
  ^ result