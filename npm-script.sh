#!/bin/bash

# automate the initialization of a new css project

read -p 'Would you like to create an index.html?: ' CREATE_HTML


# initialize file structure and install sass dependencies
if [[ "${CREATE_HTML}" == 'y' ]]
then
	read -p 'Enter a title for index.html: ' PROJECT_NAME

HTML_BOILER='<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>'${PROJECT_NAME}'</title>
	<link rel="stylesheet" href="public/styles.css">
	<script src="app.js"></script>
</head>
<body>
	<h1>Welcome to '${PROJECT_NAME}'!<h1>
	<p>github.com/prescottbreeden/sass-project-builder</p>
</body>
</html>'

	echo "${HTML_BOILER}" > index.html
else
	echo 'Create index.html: ${CREATE_HTML}... preparing SASS folders >>>'
fi

SASS_IMPORTS="@import 'abstracts/_functions';
@import 'abstracts/_mixins';
@import 'abstracts/_variables';

@import 'base/_animations';
@import 'base/_base';
@import 'base/_typography';
@import 'base/_utilities';

@import 'layouts/_footer';
@import 'layouts/_header';
@import 'layouts/_navigation';

@import 'pages/_home';"



echo '___ CREATING FILE STRUCTURE FOR SASS >>>'

mkdir -p public/css
touch public/css/styles.css public/app.js

# create folders sass > abstracts base layouts
mkdir -p sass/abstracts sass/base sass/layouts sass/pages

# add functions, mixins, variables to abstracts
touch sass/abstracts/_functions.scss sass/abstracts/_mixins.scss sass/abstracts/_variables.scss

# animations, base, typography, utilities > base
touch sass/base/_animations.scss sass/base/_base.scss sass/base/_typography.scss sass/base/_utilities.scss

# footer, header, navigation > layouts
touch sass/layouts/_footer.scss sass/layouts/_header.scss sass/layouts/_navigation.scss

# home page
touch sass/pages/_home.scss 

echo "${SASS_IMPORTS}" > sass/main.scss

# install dev dependencies
echo '___ INSTALLING DEV DEPENDENCIES >>>'
npm i --save-dev hoek
npm i --save-dev node-sass
npm i --save-dev concat
npm i --save-dev npm-run-all
npm i --save-dev postcss-cli
npm audit fix

# initialize git repository
echo '___ INITIALIZING GIT REPOSITORY >>>'
git init
echo 'node_modules/' > .gitignore

# change scripts
#sed -i 's/"test": "echo \\"Error: no test specified\\" && exit 1"/"balls": "echo \\"Yay, we did a thing!\\""/g' package.json


echo '___ SCRIPT COMPLETED ___'
