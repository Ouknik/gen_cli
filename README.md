## Gen_CLI

Gen_CLI is a command-line interface (CLI) tool for building Flutter and server applications easily using the GetX framework.
## Installation

### Linux:

1. Clone the repository to your local machine.

    ```bash
    git clone https://github.com/Ouknik/gen_cli.git
    ```

2. Navigate to the project directory.

    ```bash
    cd gen_cli
    ```

3. Open the `.bashrc` file for editing.

    ```bash
    nano ~/.bashrc
    ```

4. Add an alias for the `gen` command by appending the following line at the end of the file.

    ```bash
    alias gen='dart path_to_gen_cli/main.dart'
    ```

   Replace `path_to_gen_cli` with the actual path to the `gen_cli` directory on your system.

5. Save the changes and exit the editor.

6. Source the `.bashrc` file to apply the changes.

    ```bash
    source ~/.bashrc
    ```

7. You can now use the `gen` command from anywhere in the terminal to execute the `gen_cli` tool.

### Windows:

1. Specify the full path to the executable file `main.dart`.

2. Add the full path to the PATH variable in the system settings.

3. After that, you can use the `gen` command from anywhere in the system.


### Commands

#### 1. `gen project <ProjectName>`
Creates a new Flutter project with the specified name and sets up the project structure.
- ```bash
   gen project MyProject
   ```

#### 2. `gen page <PageName>`
Generates a new Flutter page with the specified name.
- ```bash
   gen page Login
   ```


#### 3. `gen view <ViewName>:<PageName>`
Generates a new view for a specific page in the Flutter project.
- ```bash
   gen view ItemView:Login
   ```


#### 4. `gen controller <ControllerName>:<PageName>`
Generates a new controller for a specific page in the Flutter project.
- ```bash
   gen view ItemController:Login
   ```


#### 5. `gen model <ModelSource>`
Generates a model class based on JSON data. The `<ModelSource>` can be either a URL to fetch JSON data from an API or a file path to a local JSON file stored in the `lib/app/data` directory.

Usage examples:
- `gen model url=https://example.com/api`
- `gen model file=filetest.json`

### Usage
To use Gen_CLI, simply run the desired command followed by any necessary arguments. For example:



### Contributing
Feel free to contribute to this project by submitting pull requests or reporting issues on [GitHub](https://github.com/Ouknik/gen_cli).
