local tweaks_files = {
    "b-hud",
    "b-lcam",
    "b-respawn",
    "b-area-names",
    "b-fix-collision",
    "c-box-contents",
    "c-star-pos",
    "c-trajectories",
    "c-values",
    "c-nfd",
    "c-inf-lives",
    "c-fix-ccm-slide"
}

for _, file in ipairs(tweaks_files) do
    require(file)
end
