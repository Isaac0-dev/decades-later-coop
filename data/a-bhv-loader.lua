-- more bhvs soon, mostly mops

local behavior_files = {
    "b-noteblock",
}

for _, file in ipairs(behavior_files) do
    require(file)
end