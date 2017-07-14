user_data = [
  {first_name: 'Joel', last_name: 'Guerra', },
    {first_name: 'Commander', last_name: 'Shephard', username: 'earthsaver1', email: 'commander@normandy.com', password: 'pw'},
      {first_name: 'Master', last_name: 'Chief', username: 'ih8covenant', email: 'john@unsc.gov', password: 'pw'},
        {first_name: 'Darth', last_name: 'Vader', username: 'sithlord83', email: 'darklord@empire.com', password: 'pw'},
          {first_name: 'Lara', last_name: 'Croft', username: 'tombraider', email: 'tombraider@gmail.com', password: 'pw'},
]
User.create(userdata)

challenge_data = [
  {title: 'Sum an array', input: '[1, 7, 9, 3, 4, 2, 6, -1]' output: '31' body: 'Take an array of numbers (any length) and return a single number that is the sum of all the numbers', difficulty: 1, user_id: 1}
]
