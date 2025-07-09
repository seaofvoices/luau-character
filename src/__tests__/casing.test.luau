local jestGlobals = require('@pkg/@jsdotlua/jest-globals')

local character = require('../character')

local expect = jestGlobals.expect
local it = jestGlobals.it
local describe = jestGlobals.describe

local TO_UPPER_CASES = {
    { 'a', 'A' },
    { 'i', 'I' },
    { 'á', 'Á' },
    { 'ã', 'Ã' },
    { 'ç', 'Ç' },
    { 'é', 'É' },
    { 'ö', 'Ö' },
    { 'ȝ', 'Ȝ' },
    { 'δ', 'Δ' },
    { 'ς', 'Σ' },
    { 'ї', 'Ї' },
    { 'ա', 'Ա' },
    { 'պ', 'Պ' },
    { 'ḃ', 'Ḃ' },
    { 'ṵ', 'Ṵ' },
    { 'ⰷ', 'Ⰷ' },
    { 'ⳗ', 'Ⳗ' },
    { 'ꭽ', 'Ꭽ' },
    { 'ﬄ', 'FFL' },
}

local TO_LOWER_CASES = {
    { 'A', 'a' },
    { 'FFL', 'ffl' },
    { 'I', 'i' },
    { 'Á', 'á' },
    { 'Ã', 'ã' },
    { 'Ç', 'ç' },
    { 'É', 'é' },
    { 'Ö', 'ö' },
    { 'Ȝ', 'ȝ' },
    { 'Δ', 'δ' },
    { 'Σ', 'σ' },
    { 'Ї', 'ї' },
    { 'Ա', 'ա' },
    { 'Պ', 'պ' },
    { 'Ꭽ', 'ꭽ' },
    { 'Ḃ', 'ḃ' },
    { 'Ṵ', 'ṵ' },
    { 'Ⰷ', 'ⰷ' },
    { 'Ⳗ', 'ⳗ' },
}

local UNCHANGED_CASES = {
    '-',
    '0',
    '1',
    '{',
    '\\',
    '\n',
    'ᴂ',
    '𝛇',
    '𝔰',
    '𝕒',
    'ℳ',
}

describe('toLowercase', function()
    for _, case in TO_LOWER_CASES do
        local upper = case[1]
        local lower = case[2]

        it(`converts '{upper}' to '{lower}'`, function()
            if character.toLowercase(upper) ~= lower then
                error(
                    'toLowercase '
                        .. upper
                        .. ' -> '
                        .. character.toLowercase(upper)
                        .. ' expected '
                        .. lower
                )
            end
            expect(character.toLowercase(upper) == lower).toBe(true)
        end)

        it(`keeps '{lower}' unchanged`, function()
            expect(character.toLowercase(lower) == lower).toBe(true)
        end)
    end

    for _, case in UNCHANGED_CASES do
        it(`keeps '{case}' unchanged`, function()
            expect(character.toLowercase(case)).toEqual(case)
        end)
    end
end)

describe('toUppercase', function()
    for _, case in TO_UPPER_CASES do
        local lower = case[1]
        local upper = case[2]

        it(`converts '{lower}' to '{upper}'`, function()
            if character.toUppercase(lower) ~= upper then
                error(
                    'toUppercase '
                        .. lower
                        .. ' -> '
                        .. character.toUppercase(lower)
                        .. ' expected '
                        .. upper
                )
            end
            expect(character.toUppercase(lower) == upper).toBe(true)
        end)

        it(`keeps '{upper}' unchanged`, function()
            expect(character.toUppercase(upper) == upper).toBe(true)
        end)
    end

    for _, case in UNCHANGED_CASES do
        it(`keeps '{case}' unchanged`, function()
            expect(character.toUppercase(case)).toEqual(case)
        end)
    end
end)
