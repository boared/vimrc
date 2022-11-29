# Convert a binary file to hex format in Vim
A simple way to do this is via `xxd` command which makes a hexdump of a binary file.

```
:%!xxd
:set ft=xxd
```

`%` matches whole file as a range
`!` filters that range through an external command, in this case, `xxd`

To revert the changes:

```
:%!xxd -r
```
