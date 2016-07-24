Truly Global Variables
======================

Due to an unfortunate historical precedent, global variables aren't actually _global_. In fact, they aren't even national, or provincial! It's time to fix that.

**Truly Global Variables** are variables that, indeed, span the globe. At any given time, a Truly Global Variable has the same value, regardless of who or where you are. Likewise, you can change a Truly Global Variable from anywhere and at any time, just by using them in your code.

Features\*:

* Authentication
* Availability
* Authorization
* Anonymity
* Privacy

\* that this library does not have

Best practices for concurrecy tend to frown upon shared mutable state. However, by sharing this state across potentially every computer on the internet, one fosters a sense of community and belonging amongst one's variables.

Coming soon: **Truly Global Semaphores**, for all your Truly Global Variable synchronization needs.

Usage
-----

Let's begin:

```lua
require "truly-global"

this_library_is = "pretty cool"
print(this_library_is) -- results in "pretty cool"
```

So far, so good. Now, take the first plane to the other side of the world, find the nearest internet cafe, grab a seat and run:

```lua
require "truly-global"
print(this_library_is) -- results in "pretty cool"
this_library_is = "literally the worst thing I have ever seen, including that neural network JSON parser library"
```

Back at your original location, let's see what's up with our variables:

```lua
require "truly-global"
print(this_library_is) # results in "literally the worst thing I have ever seen, including that neural network JSON parser library"
```

Details
-------

The Lua library, `truly-global.lua`, is implemented with a `_G` metatable that queries the backend. Every single global variable access or assignment triggers a network request (hey, I never said it was fast!). To install the library dependencies on Debian-derived Linux distributions, just run `install.sh`.

Why Lua over a more "mainstream" language? Mainly, I didn't really have time to much around with interpreter internals. Lua's flexibility is a huge plus here.

The backend is built on AWS Lambda, backed by DynamoDB. The AWS Lambda function source code can be found under `aws-lambda-functions`.

Built with <4 during [TerribleHack IV](http://terriblehack.website/?summer). I'm not responsible for any losses, damages, fires, earthquakes, melted ice cream, hurricanes, or angry chimpanzees resulting from the use of this library.

License
-------

I sure hope you aren't using this in production! Truly Global Variables, including the library and backend code, are made available under the MIT Licence:

  Copyright (c) 2016 Anthony Zhang

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
