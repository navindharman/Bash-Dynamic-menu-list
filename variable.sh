#!/bin/bash
var=$(cat "menu.txt" | tail -n1 | cut -d '.' -f1  )
echo $var
