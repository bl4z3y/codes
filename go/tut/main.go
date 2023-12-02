package main

import "fmt" 

func main(){
  var x string
  var salute string = "Hello, World!"
  fmt.Println(salute)
  fmt.Println("O que você quer que eu diga?")
  fmt.Scanln(&x)
  fmt.Print("\n", x)
  if (x == ""){
    println("mal-educado")
  }
}

