# linting + formatting  # # # # # # # #

prettify()
{
    if [ "$#" -eq 0 ]; then
        prettier -l '**/*.{vue,js,css,html}' | xargs prettier -w
    else
        prettier -l '**/*.{vue,js,css,html}' | grep "$1" | xargs prettier -w
    fi
}
