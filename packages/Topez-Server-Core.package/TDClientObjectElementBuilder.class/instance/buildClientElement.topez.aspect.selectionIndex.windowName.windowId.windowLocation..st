as yet unclassified
buildClientElement: parentObject topez: aTopez aspect: anAspect selectionIndex: aSelectionIndex windowName: inWindowName windowId: inWindowId windowLocation: windowLocation
  object := object asTDObjectNode: parentObject topez: aTopez aspect: anAspect.
  ^ super
    buildClientElement: parentObject
    topez: aTopez
    aspect: anAspect
    selectionIndex: aSelectionIndex
    windowName: inWindowName
    windowId: inWindowId
    windowLocation: windowLocation