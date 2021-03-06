as yet unclassified
testMethodLookup
  | tool |
  tool := TDDebugTool new.
  {{'TDDebugToolTests>>testMethodLookup'.
  {(self class name).
  #'testMethodLookup'}}.
  {'TDDebugToolTests class>>sampleClassMethod'.
  {(self class class name).
  #'sampleClassMethod'}}.
  {'Object(TDDebugToolTests)>>testMethodLookup'.
  {(self class name).
  #'testMethodLookup'}}.
  {'Object(TDDebugToolTests class)>>sampleClassMethod'.
  {(self class class name).
  #'sampleClassMethod'}}.
  {'Object class(TDDebugToolTests)>>testMethodLookup'.
  {(self class name).
  #'testMethodLookup'}}.
  {'Object class(TDDebugToolTests class)>>sampleClassMethod'.
  {(self class class name).
  #'sampleClassMethod'}}}
    do: [ :spec | 
      | methodTokens meth expected |
      methodTokens := (spec at: 1) findTokens: ' '.
      meth := tool lookupMethodIn: methodTokens.
      expected := spec at: 2.
      self assert: meth inClass name = (expected at: 1).
      self assert: meth selector = (expected at: 2) ]