Architecture
============
![](architecture-l3nn0x-proposal.png)

Module Specific header
======================

| Address | Size | Description |
|---------|------|-------------|
| 0       | 2    | [Device Type Code](https://github.com/techcompliant/TC-Specs/blob/master/device-type.md) (can be truncated if the vendor ID isn't relevant)  |
| 2       | 1    | Header version |
| 3       | 1    | Number of exposed functions (n) |
| 4       | n    | Exposed functions (API) |

Binary header
=============
| Address       | Size   | Description |
|---------------|--------|-------------|
| 0             | 1      | Magic code (0xF057) (which is replaced after loading by the number of modules/threads dependent on this binary) |
| 1             | 1      | Header version |
| 2             | 1      | Size of relocation table (n) |
| 3             | 1      | Size of binary (b) |
| 4             | 1      | Size of additional data (d) |
| 5             | 1      | Size of table dependencies ID (i) (can be 0) |
| 6             | i      | Table dependencies |
| 6 + i         | n      | Relocation table |
| 6 + i + n     | d      | Additional data |
| 6 + i + n + d | b      | Binary data |

Thread
======

| Address | Size | Description |
|---------|------|-------------|
| 0       | 1    | PID |
| 1       | 1    | PID parent |
| 2       | 1    | SP saved |
| 3       | 1    | Kernel SP saved |
| 4       | 1    | Time elapsed since the beginning of the thread |
| 5       | 1    | CPU Time left for this round |
| 6       | 1    | Priority |
| 7       | 8    | Name |
