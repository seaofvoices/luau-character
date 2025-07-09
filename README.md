<div align="center">

[![checks](https://github.com/seaofvoices/luau-character/actions/workflows/test.yml/badge.svg)](https://github.com/seaofvoices/luau-character/actions/workflows/test.yml)
![version](https://img.shields.io/github/package-json/v/seaofvoices/luau-character)
[![GitHub top language](https://img.shields.io/github/languages/top/seaofvoices/luau-character)](https://github.com/luau-lang/luau)
![license](https://img.shields.io/npm/l/luau-character)
![npm](https://img.shields.io/npm/dt/luau-character)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/seaofvoices)

</div>

# luau-character

A Luau library for Unicode character classification. This library is based on the Rust implementation of the `unicode` core library.

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
character.isAscii(char: string): boolean
```
Checks if a character is within the ASCII range.

### isAlphabetic
```luau
character.isAlphabetic(char: string): boolean
```
Checks if a character is alphabetic.

### isNumeric
```luau
character.isNumeric(char: string): boolean
```
Checks if a character is numeric.

### isAlphaNumeric
```luau
character.isAlphaNumeric(char: string): boolean
```
Checks if a character is either alphabetic or numeric.

### isLowercase
```luau
character.isLowercase(char: string): boolean
```
Checks if a character is lowercase.

### isUppercase
```luau
character.isUppercase(char: string): boolean
```
Checks if a character is uppercase.

### isControl
```luau
character.isControl(char: string): boolean
```
Checks if a character is a control character.

### isWhitespace
```luau
character.isWhitespace(char: string): boolean
```
Checks if a character is a whitespace character.

## License

This project is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.

## Other Lua Environments Support

If you would like to use this library on a Lua environment, where it is currently incompatible, open an issue (or comment on an existing one) to request the appropriate modifications.

The library uses [darklua](https://github.com/seaofvoices/darklua) to process its code.
