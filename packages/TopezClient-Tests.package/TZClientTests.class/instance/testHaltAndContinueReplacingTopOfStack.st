test debugging
testHaltAndContinueReplacingTopOfStack
    "incorrect result at the moment due to bug 42524 ... result should be 134"

    | result x topOfStack newTopOfStack |
    newTopOfStack := self runNoError: '{134. 1}'.
    result := self runExpectingError: '(Dictionary new at: 1 put: ''1''; at: 2 put: ''2''; yourself) pause at: 1'.
    result := self doNoError: [ self topez continueWith: result context replaceTopOfStackWith: newTopOfStack ].
    result displayOptions: (TZTopezOptions new displayOops: false).
    self
        assert:
            (x := result printString)
                =
                    '''1''
#1 49
'