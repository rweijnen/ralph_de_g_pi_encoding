Last night I was watching the Dutch TV show "Hunters" (S05E06 which can be found online [here](https://www.avrotros.nl/hunted/gemist/detail/item/hunted-s5-afl-6-30-11-2020/) and I noticed that one of the participants received an encrypted or encoding text message from a friend:

![screenshot from Hunted TV Show showing the encrypted text](/PiEncoded2.png?raw=true "Screenshot")

I thought it would be fun to decode/decipher it ;-)

Here are the example string from the screenshot:

```
$username = '(6+13)(2)(8+8)(12+12)(12)_(3)G@(6+14)(6+6)(6+8)(6+6+7)(6+8)(8+12)(6+3)(2)(6)(14+5).(1)(12)'
$password = '(6+6+12)H(6+6+14)&U%(5+5+3)Q(8+8+12)'
```

As you can see, some characters such as `_` `@` and `.` are note encoded and neither are uppercase letters such as `H` and `U`.
This means that we can assume that only a..z (lowercase letters) are actually encoded.

After a little think I decided to check if perhaps the numbers are used as the nth digits of the number [Pi](https://en.wikipedia.org/wiki/Pi).
`3.1415926535897932384626433..`
If we test that on the first "letter" we take `(6+13)` which would mean the 6th digit which has the value 9 and the 13th digit which also has the value 9.
`9 + 9 = 18` and the 18th letter in the alphabet is `r`

Next is `(2)` which means the second digit which is `1` and the 1st letter in the alphabet is `a`

Next is `(8+8)` which is `6+6=12` and the 12th letter in the alphabet is `l`

Next is `(12+12)` which is `8+8=16` and the 16th letter in the alphabet is `p`

Next is `(12)` which is `8` and the 8th letter in the alphabet is `h`.

Together that makes `ralph` which happens to be the first name of the participant that received the message...

So if we decode both the username and passwords strings the output seems valid:
![PowerShell console window showing the decoded strings](/screenshot.png?raw=true "Decoded Strings Screenshot")
