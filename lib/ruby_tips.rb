
Tip.create(
  name: "Golden Rule",
  category: "Ruby",
  title: "Use pry, don’t cry.",
  content: "Although pry may seem a little counter-intuitive (“why would I stop my process to use pry?!?“), it will really save you a lot of trouble if you pry often.",
  how_to: "Remember to put pry outside a method and INSIDE it as well - otherwise, pry may not work",
  url: "https://tinyurl.com/y5cffgd5"
)

Tip.create(
  name: "Errors",
  category: "Ruby",
  title: "Errors are your friends.",
  url: "https://ruby-doc.org/core-2.2.0/Exception.html",
  content: "An error is nothing else than a Ruby version of open communication and constructive feedback. It tells you where it hurts!",
  how_to: "\n Don’t freak out when you see the error. Just read it. And then again. \n Things to pay attention to: \n - check the file name and the line number, like here:'./lib/ruby_tips.rb:9';\n - check the error type, like here: '(NameError)';\n - check both in your code and if that doesn't help - google!")

  Tip.create(
    name: "A variable has no name",
    category: "Ruby",
    title: "Name your variables and name them right.",
    content: "Simple as that: if you name your variables right, debugging and refactoring will be easy-peasy. ",
    how_to: "Be descriptive (but not overly) so that your future self will exactly know where to look for what. \n Pssst. remember that class variables have an @ sign in their name, while the instance variables don't.",
    url: "https://tinyurl.com/y6ludg3o")

  Tip.create(
    name: "And you, what's your datatype?",
    category: "Ruby",
    title: "Make sure you know what datatype are your variables (and arguments).",
    content: "Imagine debugging for an hour just to later learn that the variable you passed in a method as an argument is a string and ",
    how_to: "Call a variable with .class method (for instance: puppies_array.class) - this will tell you everything.")

  Tip.create(
    name: "Hash me outside",
    category: "Ruby",
    title: "Don't iterate over hashes. What for? Just split them into arrays 🙄.",
  )

  Tip.create(
    name: "Floating around",
    category: "Ruby",
    title: "Remember to float when you do maths.",
    content: "If you're getting errors on your equations, try to float the integer.",
    how_to: ".to_f is your method!",
    url: "http://ruby.bastardsbook.com/chapters/numbers/")

  Tip.create(
    name: "Single Source of Truth",
    category: "Ruby",
    title: "I will tell the truth, the whole truth and nothing but the truth.",
    content: "When designing your domain in OO Ruby, make sure that every piece of data is saved JUST ONCE in ONE place. Other places may use this data but it should live only in one place. Otherwise you'll spend hours debugging.",
    how_to: "Use whiteboard A LOT, mark all the relations and try to challenge your assumptions.",
    url: "https://tinyurl.com/y4wb2dc7")
