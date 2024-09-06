# Scripts

A repo to contain my various scripts

## How to use

**Note**: The following guide is for UNIX based systems primarily. It has been tested and works on Linux with bash shell.

### Custom scripts

#### Step 1: Create a Custom Bash Script File

1. **Create a New Script File**:

   - Choose a location to store your custom script. A common place is `~/.bash_scripts/`. You can create this directory if it doesn't exist:

     ```bash
     mkdir -p ~/.bash_scripts
     ```

   - Create a new file within this directory, e.g., `submodule_scripts.sh` (or copy one from this repository):

     ```bash
     nano ~/.bash_scripts/submodule_scripts.sh
     ```

2. **Add Your Function to the Script**:

   - In `submodule_scripts.sh`, add your the bash function (or if you just copied the file skip this step):

     ```bash
     # ~/.bash_scripts/submodule_scripts.sh

     # Function to show branch in all submodules recursively
     git_show_branch_all_submodules() {
         local branch_name=$1
         if [[ -z "$branch_name" ]]; then
             echo "Usage: git_show_branch_all_submodules <branch_name>"
             return 1
         fi

         git submodule foreach --recursive "git show-branch $branch_name || :"
     }
     ```

   - Save and close the file (`Ctrl+O` to save, `Ctrl+X` to exit in `nano`).

#### Step 2: Source Your Custom Script in `.bashrc` or `.bash_profile`

1. **Open Your `.bashrc` or `.bash_profile`**:

   ```bash
   nano ~/.bashrc
   ```

   - Or for `.bash_profile`:

     ```bash
     nano ~/.bash_profile
     ```

2. **Add the Source Command**:

   - Add the following line to source your custom script file:

     ```bash
     source ~/.bash_scripts/submodule_scripts.sh
     ```

3. **Save and Close the File**:

   - Save and exit (`Ctrl+O` and `Ctrl+X`).

4. **Reload the Shell Configuration**:

   - To apply the changes immediately, reload your shell configuration:

     ```bash
     source ~/.bashrc
     ```

   - Or for `.bash_profile`:

     ```bash
     source ~/.bash_profile
     ```

#### Script usage

After following these steps, your custom function `git_show_branch_all_submodules` will be available in your shell, and you can use it just like before:

```bash
git_show_branch_all_submodules my-branch-name
```

### Custom aliases

#### Setup

Simply append the aliases file in your root directory and refresh your terminal.

#### Alias usage

```bash
moduleMaster
```
