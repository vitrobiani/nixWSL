# My Nix Setup For Wsl
<p>This is my nix setup for wsl. It is ever changing (as it should) but feel free to take inspiration.</p> </br>

> make sure you install nix as a wsl distribution as it is not in the microsoft store. </br>
> go to <a href="https://github.com/nix-community/NixOS-WSL">NixOS-WSL page</a> and follow the steps.

## Overview
### Profiles
<p>Where all profiles are kept includes the home.nix and configuration.nix files</p>

### Scripts
<p>I added this directory to PATH (<a href="https://github.com/vitrobiani/nixWSL/blob/dc4d866dafbdc5b022045720649f5c1f490be759/user/generalSettings/envVars.nix#L9">here</a>)
so if you want to add a script to PATH just add it there.</p>

### Trash
<p>This is just in case, when deleting a profile all profile details will be kept there with a .t suffix so you could restore them if you'd like. (no restore mechanism yet) </p>

### User
<p>This is where most configurations will be kept</p>

- app: has user apps configurations like: nvim, git etc.
- generalSettings: settings that apply to all users (if you want to add some add them there)
- lang: languages configs
- shell: most shell configurations, if you want to add any shell aliasses, plugins, tmux configs and plugins it'll be there.

## The Profile Scripts
<p>Added to <a href="https://github.com/vitrobiani/nixWSL/tree/main/user/shell#L15-L18">shell aliasses</a> as: prof, addProf, chProf and rmProf. Each of them does as told: </p>

- prof tells you the current active profile.
- addProf lets you add a profile (all profiles automatically end with -profile so there is no need to add it yourself).
- chProf lets you change your active profile (require opening a new session and <a href="">safe updating</a>)
- rmProf will remove a profile (move it to the trash directory). Keep in mind that the trash is emptied each time you remove a profile so backup anything you might need from the trash.
<br><br>

> Keep in mind: this is a work in progress and is not a finished maintained product.
> <br>please vist the <a href="https://www.vitrobiani.org/nixwsldoc/doc.html">doc</a> for more info (once it's done lol)
