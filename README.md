# Environment Manager

The environment manager for WEB applications which convenient and easy to manage environment access keys. Gives easy access, pull and push your files from/to defined environment (server).

## Installation

### PHAR

The preferred method of installation is to use the Box PHAR, which can
be downloaded from the most recent [Github Release][releases]. Subsequent updates
can be downloaded by running:

```bash
em.phar self-update
```

As the PHAR is signed, you should also download the matching
`em.phar.pubkey` to the same location. If you rename `em.phar`
to `em`, you should also rename `em.phar.pubkey` to `em.pubkey`.

# Launch

```bash
em.phar self-update
```

I recommend to rename the file `em.phar` to `em`. And than simply launch:

```bash
em self-update
```
