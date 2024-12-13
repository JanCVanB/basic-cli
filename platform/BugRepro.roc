module [
    sendZeroedStruct!,
]

import Host

sendZeroedStruct! : Host.ZeroedStruct => Result {} Str
sendZeroedStruct! = \happy ->
    Host.sendZeroedStruct! happy
