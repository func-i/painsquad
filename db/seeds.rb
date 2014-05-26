[User, Advice, Recommendation, Step].each &:destroy_all

user = User.create username: 'test user', email: 'a@b.com', password: 'password'

advice = Advice.create title: 'Default'

rec1 = advice.recommendations.create(
  style:       'slideshow',
  title:       'Behaviour Rehersal',
  image:       'http://placeotter.com/80/80',
  duration:    '5 min. to 10 min.',
  context:     'Before Procedures',
  description: 'Relaxation is an effective way to help you cope with pain and stress',
  byline:      'Use relaxation when you are worried about a procedure and during the procedure'
)
rec1.steps.create(
  content: 'Rehearse what you are going to do to relax, stay calm and get through the procedure'
)
rec1.steps.create(
  content: 'When you hit play, an audio recording will start and lead you through relaxation exercises',
  tip:     'Put all your focus into this exercise!'
)
rec1.steps.create(
  content: 'Lie down, knees bent, place 1 hand on your chest and BREATE'
)

rec2 = advice.recommendations.create(
  style:       'nested',
  title:       'Mental Games',
  image:       'http://placeotter.com/80/80',
  duration:    '5 min. to 10 min.',
  context:     'During Procedures, Headaches, Abdomen Pain, Muscle Pain',
  description: 'Relaxation is an effective way to help you cope with pain and stress',
  byline:      'Use relaxation when you are worried about a procedure and during the procedure'
)

nest1 = rec2.nested_recommendations.create title: 'Alphabet Games', style: 'nested'
nest1.steps.create content: 'Think of any category of interest, such as sports, cars, teams, animals or countries'
nest1.steps.create content: 'Try to name as many as you can that start with the letter A'
nest1.steps.create content: 'When you\'re done, move on to the letters B, C, and so on through Z'


nest2 = rec2.nested_recommendations.create title: 'Song Lyrics', style: 'nested'
nest2.steps.create content: 'Think of any category of interest, such as sports, cars, teams, animals or countries'
nest2.steps.create content: 'Try to name as many as you can that start with the letter A'
nest2.steps.create content: 'When you\'re done, move on to the letters B, C, and so on through Z'


nest3 = rec2.nested_recommendations.create title: 'Counting Tiles', style: 'nested'
nest3.steps.create content: 'Think of any category of interest, such as sports, cars, teams, animals or countries'
nest3.steps.create content: 'Try to name as many as you can that start with the letter A'
nest3.steps.create content: 'When you\'re done, move on to the letters B, C, and so on through Z'


advice.recommendations.create(
  style:       'basic',
  title:       'Gentle Exercise',
  image:       'http://placeotter.com/80/80',
  duration:    '10 min. to 40 min.',
  context:     'Muscle Pain, Headache, Abdominal Pain, Surgeries',
  description: 'Relaxation is an effective way to help you cope with pain and stress',
  byline:      'Use relaxation when you are worried about a procedure and during the procedure'
)
