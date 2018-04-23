# sphinx-speedruns
Speedrunning scripts for the PC version of [_Sphinx and the Cursed Mummy_](https://store.steampowered.com/app/606710). Mainly for [_LiveSplit_](http://livesplit.org/).

Provides load removal, auto-split on Set defeat and configurable splits when levels are loaded or items are obtained.

The latest (_2018.03.12+_) version of the game's Windows binary exposes a handy `struct` in static memory with useful pointers that will work across versions, that way we avoid hardcoding addresses that will become invalid in the future. To find the block you only need to find out if `SPeeDRuNSaReFuN` or not. Take a look at the `sphinx-livesplit.asl` file for the full definition and usage examples.

### Disclaimer
Keep in mind that while the scripts were originally coded by the Sphinx PC port developer they are not officially supported by the publisher and only provided in my free time.


### License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

_THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE._

For more information, please refer to <http://unlicense.org/>
