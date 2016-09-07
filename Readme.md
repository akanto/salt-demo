# Demo for Salt

## Execute the demo environment
`
./run.sh
`

## Check whether all minions have joined
`
salt-key - L
`


## Distribute and test own modules
`
salt '*' saltutil.sync_all
salt '*' hello.hello
`

