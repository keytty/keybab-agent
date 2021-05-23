# keybab-agent
> evolving from https://github.com/keytty/model-keybab

An agent that handles keys for Keytty, aka k-e-y-b-a-b

## What it does

Get fed with series of arbitrary keys like `["b", "a", "c", "k", "1"]`, and process in a way that Keytty accepts.

Above input could result in `["c", "2", "k"]` in case `"b"` and `"a"` are invalid and `"k"` comes with implicit `"1"`

## Prerequisites
You will need [OPA](https://www.openpolicyagent.org/docs/latest/#running-opa) to be installed as this is the engine to power the agent.

Alternatively [shell.nix](./shell.nix) and [.envrc](./.envrc) should help you setup the environment if you use [nix](https://nixos.org/) and [direnv](https://direnv.net/).

## Run
`make run`

## Test
`make test`

## Roadmap
- [ ] replicate key handling parts of [Keytty](https://keytty.com)
- [ ] be used standalone
- [ ] be used embedded
