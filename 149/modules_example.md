The big difference between modules and inheritance in Ruby is that class can only inherit from one class, 
but there can many modules included in the class. The fact that class can inherit only from one class create important
implications. Let's say that we want to create a class Sports and use it as a superclass for sports classification and final
subclass has the most important physical skills demanded for given sport.

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/11985043/22585721/76178238-e9f9-11e6-9300-2c6c1e924019.png">
</p>

The obvious problem here is that skills methods are repeating and we have to write same method in many classes. We see that 
class inheritance could be a bad idea for sharing behaviours for subclass.

But modules can be included in many classes, so there is no problem to create and include modules in subclasses. We will not
have to write whole methods, but instead include module and subclasses will have access to methods in a module if needed:

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/11985043/22589097/c8742842-ea08-11e6-99b5-064e698c42e0.png"
</p>

That's the way in which Ruby handles the Multiple Inheritance problem. We "mix-in" modules into class and we can use methods
from one module in many classes.
