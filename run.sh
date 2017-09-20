#!/bin/bash

rm main.exe 
swiftc BullCowInputValidator.swift BullCowGame.swift main.swift -o main.exe && ./main.exe
