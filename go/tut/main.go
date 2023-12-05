package main

import "fmt" 

func main(){
  var x string
  var salute string = "Hello, World!"
  fmt.Println(salute)
  fmt.Println("O que você quer que eu diga?")
  fmt.Scanln(&x)
  fmt.Printf("\n%v\n", x)
  if (x == ""){
    println("mal educado")
  }else if (x == "nigger"){
    println("KILL ALL NIGGERS")
  }else{
    println("ok boomer")
  }
}

