as yet unclassified
openAsMorphLabel: labelString
  "Build a morph viewing this transcriptStream"

  | window textMorph |
  window := (TZSystemWindow labelled: labelString) model: self.
  textMorph := TodeDebuggerWindowMorph
    on: self
    text: nil
    accept: nil
    readSelection: nil
    menu: nil.
  textMorph acceptOnCR: true.
  window addMorph: textMorph frame: (0 @ 0 corner: 1 @ 1).
  self prompt.
  ^ window
    openInWorld;
    bounds: (self cliShell topezClientClass bounds at: #'evaluator');
    yourself