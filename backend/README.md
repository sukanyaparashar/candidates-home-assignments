# Amun backend task

An exercise in implementing backend logic

## How to use it:

- `$ npm install`
- `$ npm start`
- Visit `http://localhost:3030/`

## What should be implemented

Very common task in financial engineering is to take some excel file as input, parse it and use
its values for various operations.
In this task you are asked to implement a simple excel file content validator.

At the root of the backend project you can find `input.xls` file.
Upload this file and implement (however you see fit, you can use anything you want) the method
`validateXlsWeights`.<br/>
This method should examine the uploaded file and determine wehther the sum of the values in the `Weights`
column equals 100

- If the sum equals 100 => Print to the console "The underlying weights sums to 100%"
- If the sum doesn't equals 100 => Print to the console "The underlying weights doesn't sum to 100%. The weights sum is {weightsSum}"
