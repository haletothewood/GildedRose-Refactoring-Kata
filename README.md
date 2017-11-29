[![Build Status](https://travis-ci.org/haletothewood/GildedRose-Refactoring-Kata.svg?branch=master)](https://travis-ci.org/haletothewood/GildedRose-Refactoring-Kata)

# Gilded Rose Refactoring Kata

[Completed as part of Tech Test week at Makers Academy](https://github.com/makersacademy/course/blob/master/individual_challenges/gilded_rose.md) written in Ruby and tested in Rspec.

## Getting Started

`git clone https://github.com/haletothewood/GildedRose-Refactoring-Kata` 

`bundle`  

## Usage

To see the Gilded Rose in action please run:  

`ruby texttest_fixture.rb`

## Running tests

`rspec`

## My Approach

I began with extracting the user stories from the requirements provided in the challenge. From this I diagrammed using CRC cards and so had a mental model of the how the update method affected each different item. I began by writing all the tests for the different items. This gave me a base to begin refactoring and a story to match my new methods narrative to. I went through each test for an item and wrote the simplest code in a new method to make the test pass. Once I hit green I refactored. After each items upadate functionality was extracted into a private method I began the process of extracting into separate classes. As the instructions made it clear not to edit Item, I used inheritence to create a 'Normal' item and further inheritence for each special item.