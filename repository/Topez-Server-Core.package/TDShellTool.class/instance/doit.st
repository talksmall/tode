as yet unclassified
doit
  | doitContext displayPolicy |
  doitContext := (self topez lookup: '.self') dotSelfObject.
  topez
    accumulateTextAndDo: [ :doitString :accumulateObjIn | 
      | result |
      topez exception: nil.
      result := self topez evaluateString: doitString inContext: accumulateObjIn.
      self topez objIn: result.
      result ].
  displayPolicy := topez displayPolicy
    compacted: true;
    yourself.
  doitContext displayOn: displayPolicy.
  ^ TDCommandResult new
    displayText: displayPolicy stream contents;
    resultObject: doitContext;
    yourself