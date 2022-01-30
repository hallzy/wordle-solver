# Worlde Solver

This repo contains a program to assist with solving wordle problems.

## Build

```
$ make
```

## Usage

```
$ ./wordle
```

The program is hardcoded to start with the word `stare` every time since it is a
word that has a different letter in every position to eliminate as many letters
as possible on the first guess, but also contains some of English's more common
letters.

From there the program will eliminate all words in the word list that:

* Contain black letters
* Don't contain yellow letters
* Don't contain green letters in the correct position.

The wordle program will give you a word to try and you just have to tell he
program what colour each letter came out as:

* b => black
* y => yellow
* g => green

You can also just press enter to skip checking a word if you don't like it. Some
words in the word list also aren't identified as a word by wordle so sometimes
you will have to skip a word.

NOTE: If you enter a word that has 2 of the same letter and one of the letters
is in the correct position but the wordle word only has one of those letters,
worlde will show the incorrectly placed letter as black, telling you that that
letter doesn't appear any more than that one time. This solver fails with that,
and you must tell the solver that the incorrectly placed duplicate letter is a
yellow. Plan to fix this, but haven't yet

### Example

```
 $ ./wordle

Tell me if each letter is:
    Not in the word (b)
    In the word, wrong location (y)
    In the word, correct location (g)
    Skip with a blank

stare  (15919)
bbbyb

Tell me if each letter is:
    Not in the word (b)
    In the word, wrong location (y)
    In the word, correct location (g)
    Skip with a blank

birch  (417)
bbybb

Tell me if each letter is:
    Not in the word (b)
    In the word, wrong location (y)
    In the word, correct location (g)
    Skip with a blank

dolor  (81)


Tell me if each letter is:
    Not in the word (b)
    In the word, wrong location (y)
    In the word, correct location (g)
    Skip with a blank

donor  (81)
bbyby
Answer: wrung
```
