-- more bhvs soon, mostly mops

local behavior_files = {
    "a-bhv-utils",
    "b-noteblock",
    "b-flipswap",
    "b-switchboard",
    "b-shrinkplat",
    "b-switchblock",
    "b-spring"
}

for _, file in ipairs(behavior_files) do
    require(file)
end