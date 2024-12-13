app [main!] { pf: platform "../platform/main.roc" }

import pf.BugRepro
import pf.Stdout

main! = \{} ->

    tag = Foo

    _ = Stdout.line! "🦅 tag: $(Inspect.toStr tag)"
    BugRepro.sendHappyPayloadlessTag! tag
    |> Result.mapErr (\message -> Exit 1 message)
