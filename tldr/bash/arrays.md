# Arrays

```bash
# this is how you declare an array with already entry in it
array=(ciao signori belli)

# this is how you declare an array without any entry
declare -A array
# but for populate the array you need to call the array in a specific index
array[1]=1

# for calling the array you need to wrap it inside of {}
${array[@]} # output: ciao 1 belli
${array[1]} # output: 1
```