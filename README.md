# Tailscale Serve Machine

A simple tool to publish a HTTP server into a tailscale network as
a dedicated machine. This tool is similar to `ts serve`, but notably
povisions a new machine instead of re-using the current system.

All network requests are handled within the tailscale binary. Only the
target tcp address/port will be exposed via the new machine's https
port.

### Getting Started

The following command will create a new host with a random hostname and
serve port `8080` as port https://generated-hostname.ts-domain.ts.net.
All state will be deleted when completed. It is recommended to use a auth key
that is restricted to ephemeral hostnames.

```bash
ts-serve-machine --address localhost:8080 --auth-key tskey-auth-abcdef0123456789
```

Additionally, you may pass a `--hostname` flag to select the hostname
and `--state-dir` to read/write the state files to a permanent
directory.
