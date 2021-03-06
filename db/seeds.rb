user_data = [
  {first_name: 'Joel', last_name: 'Guerra', },
    {first_name: 'Commander', last_name: 'Shephard', username: 'earthsaver1', email: 'commander@normandy.com', password: 'pw'},
      {first_name: 'Master', last_name: 'Chief', username: 'ih8covenant', email: 'john@unsc.gov', password: 'pw'},
        {first_name: 'Darth', last_name: 'Vader', username: 'sithlord83', email: 'darklord@empire.com', password: 'pw'},
          {first_name: 'Lara', last_name: 'Croft', username: 'tombraider', email: 'tombraider@gmail.com', password: 'pw'},
]
User.create(user_data)

challenge_data = [
  {title: 'Sum an array', input: '[1, 7, 9, 3, 4, 2, 6, -1]', output: '31', difficulty: 1, user_id: 1,
    body: 'Take an array of numbers (any length) and return a single number that is the sum of all the numbers'},
    {title: 'Fizz Buzz', input: "1, 3, 4, 5, 15", output: "1, Fizz, 4, Buzz, FizzBuzz", difficulty: 2, user_id: 1,
      body: 'Write a method that takes a single integer as an argument and returns Fizz is the number is divisible by 3, Buzz if the number is divisible by 5 and FizzBuzz if the number is divisible by both'}
]

Challenge.create(challenge_data)
