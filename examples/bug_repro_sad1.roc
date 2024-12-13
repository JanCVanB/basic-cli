app [main!] { pf: platform "../platform/main.roc" }

import pf.BugRepro
import pf.Stdout

main! = \{} ->

    tag = Foo 100

    _ = Stdout.line! "🦅 tag: $(Inspect.toStr tag)"
    BugRepro.sendSadPayloadfulTag! tag
    |> Result.mapErr (\message -> Exit 1 message)
