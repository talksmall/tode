accessing
customDefaultAction
  | answer process |
  answer := UIManager default
    confirm: self description
    trueChoice: 'Proceed'
    falseChoice: 'Abort'
    cancelChoice: 'Debug'
    default: false.
  answer
    ifNil: [ 
      ^ {#'debug'.
      self} ].
  answer
    ifTrue: [ ^ #'resume' ].
  ^ {#'abort'.
  (STON toString: 'Aborted...')}