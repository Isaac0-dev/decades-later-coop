local tweaks_files = {
    "b-hud",
    "b-lcam",
    "b-respawn",
    "b-area-names",
    "c-box-contents",
    "c-star-pos",
    "c-trajectories",
    "c-values"
}

for _, file in ipairs(tweaks_files) do
    require(file)
end
