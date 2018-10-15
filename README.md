# SASS-create-project-script v1.1
Bash script to generate modular SCSS folder structure for writing and organizing maintainable style sheets.  
       
## Installs Node Packages as Dev Dependencies:
- node-sass
- postcss-cli
- concat
- node-minify
- npm-run-all
- hoek _(to override audit warnings from standard node-sass hoek version)_

## Recommended Package.json Scripts:
    "scripts": {
      "watch:sass": "node-sass sass/main.scss public/css/styles.css -w",
      "compile:sass": "node-sass sass/main.scss public/css/styles.comp.css",
      "prefix:css": "postcss --use autoprefixer -b 'last 10 versions' public/css/styles.comp.css -o public/css/styles.prefixed.css",
      "compress:css": "node-sass public/css/styles.prefixed.css public/css/styles.css --output-style compressed",
      "build:css": "npm-run-all compile:sass prefix:css compress:css",
      "compress:js": "node-minify --compressor 'gcc' --input 'public/js/app.js' --output 'public/js/app.min.js'"
    },

| FUNCTION          | COMMAND LINE          | DESCRIPTION                                                       |
| ------------------| --------------------- | ----------------------------------------------------------------- |
| Watch SASS        |`$ npm run watch:sass` | Auto-exports saved changes in scss to css file for development    |
| Compile SASS      |`$ npm run compile:sass`| Compiles all SCSS in main.scss                                    |
| Auto-prefix CSS   |`$ npm run prefix:css` | Adds prefixes for CSS with last 10 browser versions               |
| Compress CSS      |`$ npm run compress:css`| Creates a minified styles.min.css file                            |
| Build CSS         |`$ npm run build:css`  | Runs Compile, Auto-prefix, and Compress for production and testing|
| Compress JS       |`$ npm run compress:js`| Creates a minified app.min.js file                                |

# Installation
### Requirements:
  - npm
  - unix bash shell

### Steps to Install:
1. Install npm globally (see: https://docs.npmjs.com/cli/install)
2. Clone or download this repository
3. Move the create script to your bin path by executing: `$ mv sass-create /usr/local/bin` (MacOS/Linux)
4. Move the destroy script to your bin path by executing: `$ mv sass-destroy /usr/local/bin` (MacOS/Linux) _(optional)_

### To Run:
1. Create a new project directory and change directory to it
2. Execute `$ sass-create` to initialize sass and static folders
3. Follow prompts and options
    - Creation of an index.html file automatically includes necessary import statements
    - Creation of a git repository will perform git init on the directory
4. Add the supplied npm scripts to your package.json (modify the filename locations as needed)
5. Happy hacking

#### sass-destroy:
- If you need to remove all files added by "sass-create", execute `$ sass-destroy` from the same directory
- **WARNING** sass-destroy will permanently delete all files created or modified, as well as any files/folders with the same names generated by sass-create (e.g. `$ rm -rf public`)

## Folders & Files Created:
- index.html
- .git
- .gitignore
- package.json _(uses your default npm init settings)_
- package-lock.json  
- **public**  
    - app.js  
    - **css**  
        - styles.css  
- **sass**
    - main.scss
    - **abstracts**  
        - _functions.scss  
        - _mixins.scss  
        - _variables.scss  
    - **base**  
        - _animations.scss  
        - _base.scss  
        - _typography.scss  
        - _utilities.scss  
    - **layouts**  
        - _footer.scss  
        - _header.scss  
        - _navigation.scss  
    - **pages**  
        - _home.scss

##### Notes:
Naturally this script is not the end-all solution for various preferences but feel free to edit the script to taylor it for your own personal needs
