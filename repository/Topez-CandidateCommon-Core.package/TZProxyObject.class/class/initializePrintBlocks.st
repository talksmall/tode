class initialization
initializePrintBlocks
  "self initialize"

  self printBlocks
    at: #'error'
      forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
      put: [ :proxy :aStream :indent | proxy renderWith: (TextColor color: Color red) on: aStream indent: indent ];
    at: #'halt'
      forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
      put: [ :proxy :aStream :indent | proxy renderWith: (TextColor color: Color orange) on: aStream indent: indent ];
    at: #'breakpoint'
      forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
      put: [ :proxy :aStream :indent | proxy renderWith: (TextColor color: Color magenta) on: aStream indent: indent ];
    at: #'basic'
      forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
      put: [ :proxy :aStream :indent | proxy renderWith: (TextColor color: Color blue) on: aStream indent: indent ];
    at: #'inspect'
      forClasses: #('TZHeaderGemStone' 'TZHeaderNative')
      put: [ :proxy :aStream :indent | aStream nextPutAll: (Text string: proxy proxyPrintString attribute: (TextColor color: Color blue)) ];
    at: #'basic'
      forClass: 'TZMethodElement'
      put: [ :proxy :aStream :indent | aStream nextPutAll: proxy selector asTopezNative ];
    at: #'label'
      forClasses: #('TZFrameMethodElement' 'TZMethodElement' 'TZMessageElement')
      put: [ :proxy :aStream :indent | 
          aStream nextPutAll: proxy elementClassName asTopezNative.
          proxy isMeta asTopezNative
            ifTrue: [ aStream nextPutAll: ' class>>' ]
            ifFalse: [ aStream nextPutAll: '>>' ].
          aStream nextPutAll: proxy selector asTopezNative ];
    at: #'basic'
      forClass: 'TZExecutedCodeElement'
      put: [ :proxy :aStream :indent | aStream nextPutAll: 'Executed Code' ];
    at: #'label'
      forClass: 'TZExecutedCodeElement'
      put: [ :proxy :aStream :indent | aStream nextPutAll: 'Executed Code' ];
    at: #'label' forClass: 'TZDoItElement' put: [ :proxy :aStream :indent | aStream nextPutAll: 'DoIt' ];
    at: #'label' forClass: 'TZTextElement' put: [ :proxy :aStream :indent | aStream nextPutAll: 'Text' ];
    at: #'basic'
      forClass: 'TZMessageElement'
      put: [ :proxy :aStream :indent | 
          | className space |
          space := ''.
          proxy indent asTopezNative timesRepeat: [ space := space , ' ' ].
          className := proxy elementClassName asTopezNative.
          proxy isMeta asTopezNative
            ifTrue: [ className := className , ' class' ].
          aStream
            nextPutAll: (Text string: space , className attribute: TextEmphasis bold);
            nextPutAll: '>>';
            nextPutAll: (Text string: proxy selector asTopezNative attribute: TextEmphasis italic) ];
    at: #'basic'
      forClass: 'TZInstanceElement'
      put: [ :proxy :aStream :indent | 
          | space label |
          space := ''.
          proxy indent asTopezNative timesRepeat: [ space := space , ' ' ].
          label := proxy label asTopezNative.
          label notEmpty
            ifTrue: [ 
              aStream
                nextPutAll: space;
                nextPutAll: proxy label asTopezNative;
                space ].
          proxy instance renderText: #'basic' on: aStream ];
    at: #'inspect'
      forClass: 'TZInstanceElement'
      put: [ :proxy :aStream :indent | 
          | space label |
          space := ''.
          proxy indent asTopezNative timesRepeat: [ space := space , ' ' ].
          label := proxy label asTopezNative.
          label notEmpty
            ifTrue: [ 
              aStream
                nextPutAll: space;
                nextPutAll: label;
                space: (15 - label size max: 1) ].
          proxy instance renderText: #'inspect' on: aStream ];
    at: #'basic'
      forClass: 'TZClassElement'
      put: [ :proxy :aStream :indent | 
          | space |
          space := ''.
          proxy indent asTopezNative timesRepeat: [ space := space , ' ' ].
          aStream
            nextPutAll:
              (Text
                string: space , proxy elementClassName asTopezNative
                attribute:
                  (proxy inExtensionClassList asTopezNative
                    ifTrue: [ TextEmphasis italic ]
                    ifFalse: [ TextEmphasis bold ])) ];
    at: #'label'
      forClass: 'TZClassElement'
      put: [ :proxy :aStream :indent | aStream nextPutAll: proxy elementClassName asTopezNative ];
    at: #'basic'
      forClass: 'TZStackFrameElement'
      put: [ :proxy :aStream :indent | 
          aStream
            tab: indent;
            nextPutAll: proxy frameIndex asTopezNative printString;
            space.
          (self printBlocks at: #'debugger' forClass: 'TZStackFrameElement' ifAbsent: [  ])
            value: proxy
            value: aStream
            value: indent ];
    at: #'debugger'
      forClass: 'TZStackFrameElement'
      put: [ :proxy :aStream :indent | 
          | methodElement receiverElement mclassName rclassName |
          methodElement := proxy methodElement.
          receiverElement := proxy receiverInstanceElement.
          mclassName := methodElement elementClassName asTopezNative asString.
          methodElement methodForBlock asTopezNative
            ifTrue: [ aStream nextPutAll: (Text string: ' [] in ' attribute: TextEmphasis bold) ].
          mclassName = 'Executed Code'
            ifTrue: [ 
              aStream
                tab: indent;
                nextPutAll: (Text string: mclassName attribute: TextEmphasis bold) ]
            ifFalse: [ 
              rclassName := receiverElement elementClassName asTopezNative asString.
              aStream
                tab: indent;
                nextPutAll: (Text string: rclassName attribute: TextEmphasis bold).
              mclassName = rclassName
                ifFalse: [ aStream nextPutAll: '(' , mclassName , ')' ].
              aStream
                nextPutAll:
                    (Text
                        string: ' >> '
                        attributes:
                          {(TextEmphasis bold).
                          (TextColor gray)});
                nextPutAll:
                    (Text
                        string: methodElement selector asTopezNative asString
                        attributes:
                          {(TextEmphasis bold).
                          (TextColor blue)}) ] ];
    at: #'basic'
      forClass: 'TZNativeStackFrame'
      put: [ :proxy :aStream :indent | 
          aStream
            tab: indent;
            nextPutAll: proxy frameIndex asTopezNative printString;
            space;
            nextPutAll: (Text string: proxy inClass name attribute: TextEmphasis bold);
            nextPutAll:
                (Text
                    string: ' >> '
                    attributes:
                      {(TextEmphasis bold).
                      (TextColor gray)});
            nextPutAll:
                (Text
                    string: proxy selector asTopezNative
                    attributes:
                      {(TextEmphasis bold).
                      (TextColor blue)});
            cr;
            tab: indent + 1;
            nextPutAll: 'receiver';
            space.
          proxy receiver renderText: #'basic' on: aStream ];
    at: #'basic'
      forClasses: #('TZProxyError' 'TZProxyBreakpoint' 'TZProxyHalt' 'TZProxyTodeCommandError')
      put: [ :proxy :aStream :indent | proxy header renderText: proxy renderAttribute on: aStream ];
    at: #'basic'
      forClass: 'TZStack'
      put: [ :stack :aStream :indent | 
          | currentFrameIndex size |
          currentFrameIndex := stack currentFrameIndex.
          size := stack indexed size.
          1 to: size do: [ :frameIndex | 
            | stackFrame |
            stackFrame := stack at: frameIndex.
            frameIndex = currentFrameIndex
              ifTrue: [ 
                aStream
                  nextPutAll:
                    (Text
                      string: '==> '
                      attributes:
                        {(TextEmphasis bold).
                        (TextColor red)}) ].
            stackFrame renderText: #'basic' on: aStream indent: indent.
            frameIndex < size
              ifTrue: [ aStream cr ] ] ]