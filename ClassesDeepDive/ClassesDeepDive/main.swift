/*
 
 Apple recommends to go with Structs by default.
 
 Structs:
 - Immutable
 - Passed by value.
 
 
 Classes:
 - are passed by reference.
 - Inheritance is possibility.
 
 */



print("Hello World")

let skeleton = Enemy(health: 100, attackStrength: 5)
let boss = Enemy(health: 1000, attackStrength: 75)

print(skeleton.attackStrength)
print(boss.attack())

let dragon = Dragon(health: 5000, attackStrength: 200)
print(dragon.attack())
dragon.attack()
  
