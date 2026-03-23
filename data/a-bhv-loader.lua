local behavior_files = {
    "a-bhv-utils",
    "b-noteblock",
    "b-flipswap",
    "b-switchboard",
    "b-shrinkplat",
    "b-switchblock",
    "b-spring",
    "b-flipswitch",
    "c-bowser-cutscene",
    "c-six-reds"
}

for _, file in ipairs(behavior_files) do
    require(file)
end