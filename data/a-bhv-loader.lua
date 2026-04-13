local behavior_files = {
    "a-bhv-utils",
    "b-noteblock",
    "b-flipswap",
    "b-switchboard",
    "b-shrinkplat",
    "b-switchblock",
    "b-spring",
    "b-flipswitch",
    "b-sl-jukebox",
    "c-bowser-cutscene",
    "c-six-reds",
    "c-blue-star",
    "c-pendulum",
    "c-blue-coin-number",
}

for _, file in ipairs(behavior_files) do
    require(file)
end
