local function binarySeachBy<T>(array: { T }, fn: (value: T) -> number): { ok: boolean, index: number }
    local size = #array
    if size == 0 then
        return { ok = false, index = 1 }
    end

    local base = 1

    while size > 1 do
        local half = math.floor(size / 2)
        local mid = base + half

        local cmp = fn(array[mid])

        if cmp <= 0 then
            base = mid
        end

        size = size - half
    end

    local cmp = fn(array[base])

    if cmp == 0 then
        return { ok = true, index = base }
    else
        local result = base + (if cmp < 0 then 1 else 0)
        return { ok = false, index = result }
    end
end

local function binarySeachByKey<T>(
    array: { T },
    key: number,
    keyFn: (value: T) -> number
): { ok: boolean, index: number }
    return binarySeachBy(array, function(value)
        return keyFn(value) - key
    end)
end

return {
    binarySeachBy = binarySeachBy,
    binarySeachByKey = binarySeachByKey,
}
