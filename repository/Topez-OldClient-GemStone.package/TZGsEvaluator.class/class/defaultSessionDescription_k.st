accessing
defaultSessionDescription_k
  "self defaultSessionDescription_k"

  self
    defaultSessionDescription:
      (OGStandardSessionDescription new
        name: 'k_gs64stone';
        stoneHost: 'foos.gemstone.com';
        stoneName: 'k_gs64stone';
        gemHost: 'foos.gemstone.com';
        netLDI: '33445';
        userId: 'DataCurator';
        password: 'swordfish';
        backupDirectory: '';
        yourself)