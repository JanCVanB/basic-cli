module [
    fluff,
    sendHappyPayloadlessTag!,
    sendSadPayloadfulTag!,
    sendSadPayloadfulTagFluffed!,
]

import Host

fluff = Host.fluff

sendHappyPayloadlessTag! : Host.HappyPayloadlessTag => Result {} Str
sendHappyPayloadlessTag! = \tag ->
    Host.sendHappyPayloadlessTag! tag

sendSadPayloadfulTag! : Host.SadPayloadfulTag => Result {} Str
sendSadPayloadfulTag! = \tag ->
    Host.sendSadPayloadfulTag! tag

sendSadPayloadfulTagFluffed! : Host.SadPayloadfulTagFluffed => Result {} Str
sendSadPayloadfulTagFluffed! = \tag ->
    Host.sendSadPayloadfulTagFluffed! tag
