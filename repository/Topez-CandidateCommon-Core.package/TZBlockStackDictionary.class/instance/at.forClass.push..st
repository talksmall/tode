accessing printing
at: aSymbol forClass: aClassname push: printBlock
    | classDict printBlockList |
    classDict := self at: aClassname ifAbsent: [ self at: aClassname put: Dictionary new ].
    printBlockList := classDict at: aSymbol ifAbsent: [ classDict at: aSymbol put: OrderedCollection new ].
    printBlockList addFirst: printBlock