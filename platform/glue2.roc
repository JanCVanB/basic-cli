platform ""
    requires {} { main : _ }
    exposes []
    packages {}
    imports []
    provides [mainForHost]

import Host

ThingsToGlue : [
    A Host.HappyPayloadlessTag,
    B Host.SadPayloadfulTag,
    C Host.SadPayloadfulTagFluffed,
]

mainForHost : ThingsToGlue
mainForHost = main
