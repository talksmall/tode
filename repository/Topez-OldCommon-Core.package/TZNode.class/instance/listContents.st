as yet unclassified
listContents
    | strm |
    strm := TextStream on: Text new.
    (self contents values sorted: [ :a :b | a printName <= b printName ])
        do: [ :child | strm nextPutAll: child renderNameText ]
        separatedBy: [ strm space: 2 ].
    ^ strm contents