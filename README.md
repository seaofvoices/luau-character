<div align="center">

[![checks](https://github.com/seaofvoices/luau-character/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/luau-character/actions/workflows/test.yml)
![version](https://img.shields.io/github/package-json/v/seaofvoices/luau-character)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/luau-character)](https://github.com/luau-lang/luau)
![license](https://img.shields.io/npm/l/luau-character)
![npm](https://img.shields.io/npm/dt/luau-character)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# luau-character

A Luau library for Unicode character classification and conversion. This library is based on the Rust implementation of the `unicode` core library.

## Installation

Add `luau-character` in your dependencies:

```bash
yarn add luau-character
```

Or if you are using `npm`:

```bash
npm install luau-character
```

## Content

**Conversion functions:**
- [toLowercase](#tolowercase)
- [toUppercase](#touppercase)

**Classification functions:**
- [isAscii](#isascii)
- [isAlphabetic](#isalphabetic)
- [isNumeric](#isnumeric)
- [isAlphaNumeric](#isalphanumeric)
- [isLowercase](#islowercase)
- [isUppercase](#isuppercase)
- [isControl](#iscontrol)
- [isWhitespace](#iswhitespace)

### toLowercase
```luau
character.toLowercase(str: string): string
```
Converts a string to lowercase. This function handles Unicode characters and can convert multi-character sequences.

### toUppercase
```luau
character.toUppercase(str: string): string
```
Converts a string to uppercase. This function handles Unicode characters and can convert multi-character sequences.

### isAscii
```luau
character.isAscii(str: string): boolean
```
Checks if all characters in the string are within the ASCII range. Returns true for empty strings.

### isAlphabetic
```luau
character.isAlphabetic(str: string): boolean
```
Checks if all characters in the string are alphabetic. Returns true for empty strings.

### isNumeric
```luau
character.isNumeric(str: string): boolean
```
Checks if all characters in the string are numeric. Returns true for empty strings.

### isAlphaNumeric
```luau
character.isAlphaNumeric(str: string): boolean
```
Checks if all characters in the string are either alphabetic or numeric. Returns true for empty strings.

### isLowercase
```luau
character.isLowercase(str: string): boolean
```
Checks if all characters in the string are lowercase. Returns true for empty strings.

### isUppercase
```luau
character.isUppercase(str: string): boolean
```
Checks if all characters in the string are uppercase. Returns true for empty strings.

### isControl
```luau
character.isControl(str: string): boolean
```
Checks if all characters in the string are control characters. Returns true for empty strings.

### isWhitespace
```luau
character.isWhitespace(str: string): boolean
```
Checks if all characters in the string are whitespace characters. Returns true for empty strings.

## License

This project is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.

## Other Lua Environments Support

If you would like to use this library on a Lua environment, where it is currently incompatible, open an issue (or comment on an existing one) to request the appropriate modifications.

The library uses [darklua](https://github.com/seaofvoices/darklua) to process its code.
