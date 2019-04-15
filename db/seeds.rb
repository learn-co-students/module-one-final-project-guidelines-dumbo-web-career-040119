Directory.destroy_all
Tip.destroy_all
User.destroy_all

Tip.create(
  name: "Golden Rule",
  category: "Ruby",
  title: "Use pry, don’t cry.",
  content: "Although pry may seem a little counter-intuitive (“why would I stop my process to use pry?!?“), it will really save you a lot of trouble if you pry often."
)

Tip.create(
  name: "Errors",
  category: "Ruby",
  title: "Errors are your friends.",
  content: "An error is nothing else than a Ruby version of open communication and constructive feedback. It tells you where it hurts! Don’t freak out when you see the error. Just read it. And then again."
)

User.new(name: "Samantha", email: "fakeperson@sample.com")
