#!/bin/sh

# Ensure the user inputs a github username either through an argument or when prompted
if [ -z $1 ]
then
    confirm='n'
    while [ $confirm != 'y' ]
    do
        read -p 'Github Username: ' username
        read -p "Confirm username is $username ? (y/n): " confirm
    done
else
    username=$1
fi

# Ensure a repository name is specified. Default will be the parent folder name.
if [ -z $2 ] 
then
    confirm='n'
    while [ $confirm != 'y' ]
    do
        read -p 'Repository Name: ' REPO
        if [ -z $REPO ]
        then
            REPO=$(basename $PWD)
            break
        else
            read -p "Confirm Repository Name is $REPO ? (y/n): " confirm
        fi
    done
else
    REPO=$2
fi

# Npm setup with default user config
npm init -y
npm install webpack webpack-cli --save-dev
npm install --save-dev style-loader css-loader

# Project structure setup
echo "node_modules/" > .gitignore

echo "# $REPO
This project was initialized and uploaded by a shell script." > README.md

echo "const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: 'development',
  devtool: 'inline-source-map',
  devServer: {
    static: './dist',
  },
  entry: {
    index: './src/index.js',
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: '$(basename $PWD)',
    }),
  ],
  output: {
    filename: '[name].bundle.js',
    path: path.resolve(__dirname, 'dist'),
    clean: true,
  },
  module: {
    rules: [
      {
        test: /\.css$/i,
        use: ['style-loader', 'css-loader'],
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: 'asset/resource',
      },
    ],
  },
};" > webpack.config.js

mkdir dist
mkdir src
touch dist/index.html
touch src/index.js
touch src/style.css

git init
git add .
git commit -m "Project init"
git branch -M main
git remote add origin git@github.com:"$username/$REPO".git
git pull origin main --rebase
git push -u origin main

echo "

Finished

"